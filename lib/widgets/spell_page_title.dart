import 'package:flutter/material.dart';

import '../src/utils.dart';

class SpellPageTitle extends StatelessWidget {
  final Map _spell;
  const SpellPageTitle(this._spell, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(top: 12.0, bottom: 8.0), child: Text(_spell['name'], style: const TextStyle(fontSize: 28))),
      Padding(padding: const EdgeInsets.only(bottom: 8.0), child: Text(getSpellType(_spell['school'], _spell['level']), style: TextStyle(color: Theme.of(context).disabledColor))),
    ]);
  }
}
