// ignore_for_file: avoid_classes_with_only_static_members

import 'package:hive/hive.dart';
import 'package:smart_budget_companion_113/model/smart_budget_model.dart';

class HiveHelper<T> {
  static const String boxName = 'smartBudget';

  static Future<void> addSpending(SpendingModel model) async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<SpendingModel>(boxName)
        : await Hive.openBox<SpendingModel>(boxName);

    final savedSpandings = box.values.toList();

    if (savedSpandings.isNotEmpty) {
      for (var e in savedSpandings) {
        if (e.date == model.date) {
          e.amount += model.amount;
          e.save();
        } else {
          box.add(model);
        }
      }
    } else {
      box.add(model);
    }
  }

  static Future<List<SpendingModel>> getSpendings() async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<SpendingModel>(boxName)
        : await Hive.openBox<SpendingModel>(boxName);
    return box.values.toList();
  }

  static Future<void> removeSpending(SpendingModel model) async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<SpendingModel>(boxName)
        : await Hive.openBox<SpendingModel>(boxName);
    final savedSpandings = box.values.toList();
    for (var e in savedSpandings) {
      if (e.date == model.date) {
        e.amount -= model.amount;
        e.save();
      }
    }
  }

  static Future<void> clear() async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<SpendingModel>(boxName)
        : await Hive.openBox<SpendingModel>(boxName);
    box.clear();
  }
}
