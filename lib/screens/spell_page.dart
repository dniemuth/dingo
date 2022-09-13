import 'package:flutter/material.dart';
import '../widgets/spell_page_metadata.dart';
import '../widgets/spell_page_title.dart';
import '../widgets/spell_page_footer.dart';
import '../widgets/spell_page_body.dart';

class SpellPage extends StatelessWidget {
  final Map _spell;
  const SpellPage(this._spell, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SpellPageTitle(_spell),
                Divider(
                  color: Theme.of(context).colorScheme.onBackground,
                  height: 36,
                ),
                SpellPageMetadata(_spell),
                Divider(
                  color: Theme.of(context).colorScheme.onBackground,
                  height: 36,
                ),
                SpellPageBody(_spell),
                Divider(
                  color: Theme.of(context).colorScheme.onBackground,
                  height: 36,
                ),
                SpellPageFooter(_spell),
                Divider(
                  color: Theme.of(context).colorScheme.onBackground,
                  height: 36,
                ),
              ]))),
    );
  }
}
