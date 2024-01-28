import 'package:hive_flutter/hive_flutter.dart';

part 'budget_local_dto.g.dart';

@HiveType(typeId: 4)
class BudgetLocalDto extends HiveObject {
  @HiveField(0)
  String reg;
  @HiveField(1)
  String log;
  @HiveField(2)
  String cab;
  @HiveField(3)
  bool strt;

  BudgetLocalDto({
    required this.strt,
    required this.cab,
    required this.log,
    required this.reg,
  });
}
