import 'dart:convert';

import 'package:demo_day/features/events/data/models/responses/events_model.dart';
import 'package:flutter/services.dart';

abstract class EventsAssetsDataSource {
  Future<List<EventModel>> getEventsJsonFromAssets();
}

class EventsAssetsDataSourceImpl implements EventsAssetsDataSource {
  @override
  Future<List<EventModel>> getEventsJsonFromAssets() async {
    try {
      final json =
          await rootBundle.loadString('assets/json/events_data.json').then(
                (jsonStr) => jsonDecode(jsonStr),
              );
      return EventModel.fromJsonList(json);
    } catch (e) {
      rethrow;
    }
  }
}
