// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TicketHiveModelAdapter extends TypeAdapter<TicketHiveModel> {
  @override
  final int typeId = 1;

  @override
  TicketHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TicketHiveModel(
      name: fields[0] as String?,
      seat: fields[1] as String?,
      isOpeningCeremony: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TicketHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.seat)
      ..writeByte(2)
      ..write(obj.isOpeningCeremony);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TicketHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
