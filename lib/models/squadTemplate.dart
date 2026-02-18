import 'unitTemplate.dart';
import 'faction.dart';
import 'stat.dart';
import 'package:uuid/uuid.dart';

class SquadTemplate
{
  var                 uuid = const Uuid();
  String              name;
  List<Stat>          stats = [];
  List<UnitTemplate>  units = [];
  //Faction             faction;
  int                 basicCost;

  static final List<Stat> defaultStats = [
    Stat(name: 'M',  fullName: 'Movement'),
    Stat(name: 'WS', fullName: 'Weapon Skill'),
    Stat(name: 'BS', fullName: 'Ballistic Skill'),
    Stat(name: 'S',  fullName: 'Strength'),
    Stat(name: 'T',  fullName: 'Toughness'),
    Stat(name: 'W',  fullName: 'Wounds'),
    Stat(name: 'I',  fullName: 'Initiative'),
    Stat(name: 'A',  fullName: 'Attacks'),
    Stat(name: 'Ld', fullName: 'Leadership'),
    Stat(name: 'Sv', fullName: 'Save'),
  ];

  SquadTemplate({
    required this.name,
    required this.basicCost,
    //required this.faction,
  });
}