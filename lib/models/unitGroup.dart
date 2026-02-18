import 'faction.dart';
import 'unitTemplate.dart';
import 'package:uuid/uuid.dart';

class UnitGroup
{
  UnitTemplate  template;
  int           count = 0;

  UnitGroup({required this.template});
}