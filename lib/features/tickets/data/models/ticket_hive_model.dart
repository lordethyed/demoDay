import 'package:hive_flutter/hive_flutter.dart';

part 'ticket_hive_model.g.dart';

@HiveType(typeId: 1)
class TicketHiveModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? seat;
  @HiveField(2)
  bool? isOpeningCeremony;

  TicketHiveModel({
    this.name,
    this.seat,
    this.isOpeningCeremony,
  });
}
