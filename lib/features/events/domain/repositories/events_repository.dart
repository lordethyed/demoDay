import 'package:demo_day/features/events/data/datasource/assets/events_assets_datasource.dart';
import 'package:demo_day/features/events/data/models/static/events_hive_model.dart';
import 'package:hive/hive.dart';

abstract class EventsRepository {
  Future<Box<EventsHiveModel>> getEvents();
}

class EventsRepositoryImpl extends EventsRepository {
  final EventsAssetsDataSource assetsDataSource;
  final Box<EventsHiveModel> eventBox;

  EventsRepositoryImpl({
    required this.assetsDataSource,
    required this.eventBox,
  });

  @override
  Future<Box<EventsHiveModel>> getEvents() async {
    try {
      if (eventBox.isEmpty) {
        final data = await assetsDataSource.getEventsJsonFromAssets();
        for (var event in data) {
          eventBox.add(
            EventsHiveModel(
              eventId: event.eventId,
              eventTitle: event.eventTitle,
              eventText: event.eventText,
              eventReadStatus: event.eventReadStatus,
              eventPictures: event.eventPictures,
            ),
          );
        }
      }
      return eventBox;
    } catch (e) {
      rethrow;
    }
  }
}
