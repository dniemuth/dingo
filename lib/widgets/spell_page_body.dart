import 'package:flutter/material.dart';

import '../src/utils.dart';

class SpellPageBody extends StatelessWidget {
  final Map _spell;
  const SpellPageBody(this._spell, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      for (var entry in _spell['entries']) _displayEntry(entry, context),
      if (_spell.containsKey('entriesHigherLevel'))
        for (var hEntry in _spell['entriesHigherLevel']) _displayHeigherEntries(hEntry, context),
    ]);
  }
}

Widget _displayEntry(entry, BuildContext context) {
  if (entry is String) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 4.0), child: Text(fixBody(entry), style: const TextStyle(height: 1.8)));
  }
  if ((entry as Map).containsKey('type') && entry.containsKey('name')) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: RichText(
          text: TextSpan(
            text: '${entry['name']}. ',
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.bold, height: 1.8),
            children: <TextSpan>[
              for (var additionalEntry in entry['entries'])
                TextSpan(
                  text: fixBody(additionalEntry),
                  style: const TextStyle(fontWeight: FontWeight.normal),
                )
            ],
          ),
        ));
  }
  if (entry.containsKey('type') && entry.containsKey('items')) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var item in entry['items']) ListTile(horizontalTitleGap: 0.0, leading: const Text('\u2022 '), title: Text(item))
          ],
        ));
  }
  return const Text('Advanced Type', style: TextStyle(height: 1.8));
}

Widget _displayHeigherEntries(hEntry, BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          text: '${hEntry['name']}. ',
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.bold, height: 1.8),
          children: <TextSpan>[
            for (var additionalEntry in hEntry['entries'])
              TextSpan(
                text: additionalEntry,
                style: const TextStyle(fontWeight: FontWeight.normal),
              )
          ],
        ),
      ));
}
