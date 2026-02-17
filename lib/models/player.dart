import 'squad.dart';

class Player
{
  String        name;
  int           armyPoints = 0;
  int           gamePoints = 0;
  List<Squad>   squads = [];

  Player(this.name);
}