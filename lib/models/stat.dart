import 'package:uuid/uuid.dart';

class Stat
{
  var uuid = const Uuid();
  String name;
  String fullName;
  int    value = 0;

  Stat({
     required this.name,
     required this.fullName,
  });
}