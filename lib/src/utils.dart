String getSpellType(String schoolCode, int level) => level > 0 ? 'Level $level ${getSchoolName(schoolCode)}' : '${getSchoolName(schoolCode)} Cantrip';

String getSchoolName(String schoolCode) =>
    ({
      'A': 'Abjuration',
      'C': 'Conjuration',
      'D': 'Divination',
      'E': 'Enchantment',
      'V': 'Evocation',
      'I': 'Illusion',
      'N': 'Necromancy',
      'T': 'Transmutation',
    }[schoolCode]) ??
    'Magic';

String fixBody(String entry) {
  final regexDiceAndDamage = RegExp(r'\{@(damage|dice)\s([^}]+)\}', caseSensitive: false);
  final regexScaleDice = RegExp(r'\{@(scale\w+)\s(?:.+|.+|)(\d+d\d+)\}', caseSensitive: false);
  final regexCondition = RegExp(r'\{@(condition)\s([^}]+)\}', caseSensitive: false);
  final regexSpell = RegExp(r'\{@(spell)\s([^}]+)\}', caseSensitive: false);
  final regexFilter = RegExp(r'\{@(filter|adventure)\s([^|]+)(?:[^}]*)\}', caseSensitive: false);
  final regexItem = RegExp(r'\{@(item)\s([^}|]+)\|(?:[^}|]+)\|*([^}|]+)*\}', caseSensitive: false);
  final regexCreature = RegExp(r'\{@(creature)\s(?:.+\|\|)*([^}]+)\}', caseSensitive: false);
  final regexSense = RegExp(r'\{@(sense)\s([^}]+)\}', caseSensitive: false);
  try {
    return entry.trim().replaceAllMapped(regexDiceAndDamage, (match) => '${match.group(2)}').replaceAllMapped(regexScaleDice, (match) => '${match.group(2)}').replaceAllMapped(regexSpell, (match) => '${match.group(2)}').replaceAllMapped(regexFilter, (match) => '${match.group(2)}').replaceAllMapped(regexCreature, (match) => '${match.group(2)}').replaceAllMapped(regexItem, (match) => '${match.group(3) ?? match.group(2)}').replaceAllMapped(regexSense, (match) => '${match.group(2)}').replaceAllMapped(regexCondition, (match) => '${match.group(2)}');
  } catch (error) {
    print(error);
    return 'You were counter spelled... womp womp';
  }
}
