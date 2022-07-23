import 'package:flutter/material.dart';

import '../src/utils.dart';
import '../screens/spell_page.dart';

class SpellCard extends StatelessWidget {
  final Map _spell;
  const SpellCard(this._spell, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SpellPage(_spell)),
          );
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: ListTile(
              title: Padding(padding: const EdgeInsets.only(bottom: 4.0), child: Text(_spell['name'] ?? '', style: const TextStyle(fontSize: 24))),
              subtitle: Text(getSpellType(_spell['school'], _spell['level'])),
              trailing: Icon(Icons.add, size: 38, color: Theme.of(context).colorScheme.secondary,),
            )),
      ),
    );
  }
}
