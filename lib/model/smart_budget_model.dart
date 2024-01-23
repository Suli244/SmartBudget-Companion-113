import 'package:hive/hive.dart';

part 'smart_budget_model.g.dart';

@HiveType(typeId: 0)
class SpendingModel extends HiveObject {
  @HiveField(0)
  String amount;

  @HiveField(1)
  String date;

  SpendingModel({
    required this.amount,
    required this.date,
  });

  @override
  String toString() => 'SpendingModel(amount: $amount, date: $date)';
}
