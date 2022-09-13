import 'package:flutter/material.dart';

class SpellPageFooter extends StatelessWidget {
  final Map _spell;
  const SpellPageFooter(this._spell, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (_spell.containsKey('source'))
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                text: 'Source: ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: '${_spell['source']}', style: TextStyle(color: Theme.of(context).disabledColor)),
                ],
              ),
            )),
      if (_spell.containsKey('classes'))
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                text: 'Classes: ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  for (var i = 0; i < _spell['classes']['fromClassList'].length; i ++)
                    TextSpan(text: '${(i != 0 ? ', ' : '')}${_spell['classes']['fromClassList'][i]['name']}', style: TextStyle(color: Theme.of(context).disabledColor))
                ],
              ),
            )),
    ]);
  }
}
