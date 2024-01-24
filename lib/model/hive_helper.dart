// ignore_for_file: avoid_classes_with_only_static_members

import 'package:hive/hive.dart';
import 'package:smart_budget_companion_113/model/smart_budget_model.dart';

class HiveHelper<T> {
  static const String boxName = 'smartBudget';

  static Future<void> addBla(SpendingModel model) async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<SpendingModel>(boxName)
        : await Hive.openBox<SpendingModel>(boxName);
    box.put(boxName, model);
  }

  static Future<SpendingModel?> getBla() async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<SpendingModel>(boxName)
        : await Hive.openBox<SpendingModel>(boxName);
    return box.get(boxName);
  }

  static Future<void> clear() async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<SpendingModel>(boxName)
        : await Hive.openBox<SpendingModel>(boxName);
    box.clear();
  }
}
