import 'faction.dart';
import 'package:uuid/uuid.dart';

class UnitTemplate
{
  var           uuid = const Uuid();
  String        name;
  //Faction       faction;
  int           currentWounds;
  List<String>? weapons;

  UnitTemplate({
    required this.name,
    //required this.faction,
    required this.currentWounds
  });
}