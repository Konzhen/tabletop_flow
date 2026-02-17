import 'unit.dart';
import 'faction.dart';
import 'package:uuid/uuid.dart';

class Squad
{
  var         uuid = const Uuid();
  String      name;
  List<Unit>  units = [];
  Faction     faction;
  int         number;
  int         basicCost;

  static const statLabels = {
    'M': 'Movement',
    'WS': 'Weapon Skill',
    'BS': 'Ballistic Skill',
    'S': 'Strength',
    'T': 'Toughness',
    'W': 'Wounds',
    'I': 'Initiative',
    'A': 'Attacks',
    'Ld': 'Leadership',
    'Sv': 'Save',
  };

  // Basic Stats
  int         movement;
  int         weaponSkill;
  int         ballisticSkill;
  int         strength;
  int         toughness;
  int         wounds;
  int         initiative;
  int         attacks;
  int         leadership;
  int         save;

  // Conditional Stats
  int?        invulnerableSave;
  int?        hullPoints;
  int?        armorValueFront;
  int?        armorValueSide;
  int?        armorValueRear;

  Squad({
    required this.name,
    required this.faction,
    required this.number,
    required this.basicCost,
    required this.movement,
    required this.weaponSkill,
    required this.ballisticSkill,
    required this.strength,
    required this.toughness,
    required this.wounds,
    required this.initiative,
    required this.attacks,
    required this.leadership,
    required this.save,
    this.invulnerableSave,
    this.hullPoints,
    this.armorValueFront,
    this.armorValueSide,
    this.armorValueRear,
  });
}