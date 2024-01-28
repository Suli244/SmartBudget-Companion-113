// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_local_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetLocalDtoAdapter extends TypeAdapter<BudgetLocalDto> {
  @override
  final int typeId = 4;

  @override
  BudgetLocalDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetLocalDto(
      strt: fields[3] as bool,
      cab: fields[2] as String,
      log: fields[1] as String,
      reg: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetLocalDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.reg)
      ..writeByte(1)
      ..write(obj.log)
      ..writeByte(2)
      ..write(obj.cab)
      ..writeByte(3)
      ..write(obj.strt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetLocalDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
