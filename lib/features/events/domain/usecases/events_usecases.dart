import 'package:demo_day/features/events/data/models/static/events_hive_model.dart';
import 'package:demo_day/features/events/domain/repositories/events_repository.dart';

abstract class EventsUseCases {
  Future<List<EventsHiveModel>> getEvents();
}

class EventsUseCasesImpl implements EventsUseCases {
  final EventsRepository repository;

  EventsUseCasesImpl({
    required this.repository,
  });

  @override
  Future<List<EventsHiveModel>> getEvents() async {
    try {
      final data = await repository.getEvents();
      final dataList = data.values.toList();
      return dataList;
    } catch (e) {
      rethrow;
    }
  }
}
