import 'package:flutter/material.dart';

class SpellPageMetadata extends StatelessWidget {
  final Map _spell;
  const SpellPageMetadata(this._spell, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (_spell.containsKey('time'))
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                text: 'Casting Time: ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: '${_spell['time'][0]['number'].toString()} ${_spell['time'][0]['unit']}', style: TextStyle(color: Theme.of(context).disabledColor)),
                ],
              ),
            )),
      if (_spell.containsKey('range'))
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                text: 'Range/Area: ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: '${_spell['range']['distance']['amount'].toString()} ${_spell['range']['distance']['type']}', style: TextStyle(color: Theme.of(context).disabledColor)),
                ],
              ),
            )),
      if (_spell.containsKey('components'))
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                text: 'Components: ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: _displayComponents(_spell['components']), style: TextStyle(color: Theme.of(context).disabledColor)),
                ],
              ),
            )),
      if (_spell.containsKey('duration'))
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                text: 'Duration: ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  if (_spell['duration'][0].containsKey('concentration')) TextSpan(text: 'Concentration, up to ', style: TextStyle(color: Theme.of(context).disabledColor)),
                  TextSpan(text: _displayDuration(_spell['duration'][0]), style: TextStyle(color: Theme.of(context).disabledColor)),
                ],
              ),
            )),
      if (_spell.containsKey('savingThrow'))
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                text: 'Attack/Save: ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  for (String save in _spell['savingThrow']) TextSpan(text: '${save[0].toUpperCase()}${save.substring(1).toLowerCase()}', style: TextStyle(color: Theme.of(context).disabledColor)),
                ],
              ),
            )),
    ]);
  }
}

String _displayComponents(Map components) {
  String result = '';
  components.forEach(((key, value) => {
        result = value.runtimeType == String ? '$result ${key.toUpperCase()} ($value),' : '$result ${key.toUpperCase()},'
      }));
  return result.substring(0, result.length - 1);
}

String _displayDuration(Map duration) {
  if (duration.containsKey('duration')) {
    return '${duration['duration']['amount'].toString()} ${duration['duration']['type']}(s)';
  }
  return 'Instantaneous';
}
