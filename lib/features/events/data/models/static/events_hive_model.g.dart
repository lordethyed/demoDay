// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventsHiveModelAdapter extends TypeAdapter<EventsHiveModel> {
  @override
  final int typeId = 0;

  @override
  EventsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventsHiveModel(
      eventId: fields[0] as String?,
      eventTitle: fields[1] as String?,
      eventText: fields[2] as String?,
      eventReadStatus: fields[3] as bool?,
      eventPictures: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, EventsHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.eventId)
      ..writeByte(1)
      ..write(obj.eventTitle)
      ..writeByte(2)
      ..write(obj.eventText)
      ..writeByte(3)
      ..write(obj.eventReadStatus)
      ..writeByte(4)
      ..write(obj.eventPictures);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
