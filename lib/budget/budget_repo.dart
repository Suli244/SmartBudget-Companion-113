import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_budget_companion_113/budget/budget_local_dto.dart';

class BudgetRepo {
  Future<BudgetLocalDto?> budgetHiveGet() async {
    final budgetHive = await Hive.openBox<BudgetLocalDto>('budgetHive');
    return budgetHive.get('budget');
  }

  Future<void> budgetHiveSet(BudgetLocalDto budgetHiveObject) async {
    final budgetHive = await Hive.openBox<BudgetLocalDto>('budgetHive');
    await budgetHive.put('budget', budgetHiveObject);
  }
}
