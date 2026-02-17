import 'faction.dart';
import 'package:uuid/uuid.dart';

class Unit
{
  var           uuid = const Uuid();
  String        name;
  Faction       faction;
  int           number;
  List<String>? weapons;

  Unit({
    required this.name,
    required this.faction,
    required this.number
  });
}