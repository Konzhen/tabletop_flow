import 'squadTemplate.dart';

class Player
{
  String        name;
  int           armyPoints = 0;
  int           gamePoints = 0;
  List<SquadTemplate>   squads = [];

  Player(this.name);
}