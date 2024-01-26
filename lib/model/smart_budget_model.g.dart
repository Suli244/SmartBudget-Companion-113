// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_budget_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpendingModelAdapter extends TypeAdapter<SpendingModel> {
  @override
  final int typeId = 0;

  @override
  SpendingModel read(BinaryReader reader) {
    final numOvVieltz = reader.readByte();
    final vieltz = <int, dynamic>{
      for (int ii = 0; ii < numOvVieltz; ii++) reader.readByte(): reader.read(),
    };
    return SpendingModel(
      amount: vieltz[0] as int,
      date: vieltz[1] as String,
      id: vieltz[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SpendingModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpendingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
