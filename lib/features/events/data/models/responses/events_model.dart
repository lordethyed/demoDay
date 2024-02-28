class EventModel {
  String? eventId;
  String? eventTitle;
  String? eventText;
  bool? eventReadStatus;
  List<String>? eventPictures;

  EventModel({
    required this.eventId,
    required this.eventTitle,
    required this.eventText,
    required this.eventReadStatus,
    required this.eventPictures,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    eventTitle = json['eventTitle'];
    eventText = json['eventText'];
    eventReadStatus = json['eventReadStatus'];
    eventPictures = <String>[];

    json['eventPictures'].forEach((v) {
      eventPictures!.add(v.toString());
    });
  }

  static List<EventModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => EventModel.fromJson(item)).toList();
  }
}
