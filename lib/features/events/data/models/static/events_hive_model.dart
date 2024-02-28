import 'package:hive_flutter/hive_flutter.dart';

part 'events_hive_model.g.dart';

@HiveType(typeId: 0)
class EventsHiveModel extends HiveObject {
  @HiveField(0)
  String? eventId;
  @HiveField(1)
  String? eventTitle;
  @HiveField(2)
  String? eventText;
  @HiveField(3)
  bool? eventReadStatus;
  @HiveField(4)
  List<String>? eventPictures;

  EventsHiveModel({
    this.eventId,
    this.eventTitle,
    this.eventText,
    this.eventReadStatus,
    this.eventPictures,
  });
}
