import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/search_box.dart';
import '../widgets/spell_list.dart';
import '../widgets/filter_dialog.dart';
import '../providers/auth_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Consumer(builder: (context, ref, _) {
      final auth = ref.watch(authenticationProvider);
      // final database = ref.watch(databaseProvider);
      final spells = ref.watch(spellsFuture);

      return Scaffold(
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            leading: IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Menu',
                onPressed: () {
                  print('Open Menu');
                }),
            title: SearchBox(),
            titleSpacing: 0,
            // title: TextField(
            //   decoration: const InputDecoration(
            //     hintText: 'Search...',
            //     hintStyle: TextStyle(
            //       color: Color(0xffA7A7A7),
            //       fontSize: 18,
            //       fontStyle: FontStyle.italic,
            //     ),
            //     border: InputBorder.none,
            //   ),
            //   style: TextStyle(
            //     color: Theme.of(context).colorScheme.onSurface
            //   ),
            // ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.tune),
                tooltip: 'Set Options',
                onPressed: () {
                  print('Show Options');
                  showDialog<void>(context: context, builder: (context) => FilterDialog());
                },
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'Log Out',
                onPressed: () {
                  auth.signOut();
                },
              )
            ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // StreamBuilder<dynamic>(
              //   stream: database?.allSpells,
              //   builder: (context, snapshot) {
              //     if (!snapshot.hasData) {
              //       return const Text('Loading');
              //     }
              //     if (snapshot.error != null) {
              //       return const Text('There was an error');
              //     }
              //     return SpellsWidget(snapshot.data.docs);
              //   },
              // ),
              Container(
                  child: spells.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (Object error, StackTrace? stackTrace) => Center(child: Text('${stackTrace.toString()} ${error.toString()}')),
                data: (spells) {
                  spells.sort((a, b) => a['name'].compareTo(b['name']) as int);
                  return spells.isNotEmpty ? Expanded(child: SpellList(spells)) : const Center(child: Text('Aint No Spells'));
                },
              ))
              // Container(
              //     child: Expanded(
              //         child: GroupedListView<dynamic, String>(
              //             elements: testSpells,
              //             groupBy: (spell) => spell['level'].toString(),
              //             useStickyGroupSeparators: true,
              //             groupHeaderBuilder: (groupByValue) => Padding(padding: const EdgeInsets.all(8.0), child: Text('Spells: ${groupByValue['level']}')),
              //             // primary: false,
              //             // itemCount: spells.length,
              //             indexedItemBuilder: (context, spell, index) {
              //               // final Map spell = spells[index] as Map;
              //               return Card(child: ListTile(title: Text(spell['name'])));
              //             })))
            ],
          ),
        ),
      );
    })));
  }
}

class SpellsWidget extends StatelessWidget {
  final List<QueryDocumentSnapshot> _spellsList;
  const SpellsWidget(this._spellsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(_spellsList[0].data());

    return _spellsList.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              itemCount: _spellsList.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                final Map currentCharacter = _spellsList[index].data() as Map;
                return ListTile(
                  title: Text(currentCharacter['name']),
                  subtitle: Text(currentCharacter['class']),
                );
              },
            ),
          )
        : const Center(child: Text('Aint No Spells'));
  }
}
