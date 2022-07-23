import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'spell_card.dart';

class SpellList extends StatelessWidget {
  final List _spells;
  const SpellList(this._spells, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupedListView(
        elements: _spells,
        groupBy: (spell) => (spell as Map)['name'][0],
        useStickyGroupSeparators: true,
        stickyHeaderBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        groupHeaderBuilder: (groupByValue) => Padding(padding: const EdgeInsets.all(8.0), child: Text('Spells: ${(groupByValue as Map)['name'][0]}')),
        itemComparator: (a, b) => (a as Map)['name'].compareTo((b as Map)['name']) as int,
        indexedItemBuilder: (context, spell, index) {
          return SpellCard(spell as Map);
        });
  }
}
