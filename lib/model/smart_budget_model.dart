import 'package:hive/hive.dart';

part 'smart_budget_model.g.dart';

@HiveType(typeId: 0)
class SpendingModel extends HiveObject {
  @HiveField(0)
  int amount;

  @HiveField(1)
  String date;

  @HiveField(2)
  int id;

  SpendingModel({
    required this.amount,
    required this.date,
    required this.id,
  });

  @override
  String toString() => 'SpendingModel(amount: $amount, date: $date)';
}
