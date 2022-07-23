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
