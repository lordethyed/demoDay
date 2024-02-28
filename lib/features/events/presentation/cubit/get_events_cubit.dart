import 'package:bloc/bloc.dart';
import 'package:demo_day/features/events/data/models/static/events_hive_model.dart';
import 'package:demo_day/features/events/domain/usecases/events_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'get_events_state.dart';
part 'get_events_cubit.freezed.dart';

class GetEventsCubit extends Cubit<GetEventsState> {
  GetEventsCubit({
    required this.useCases,
    required this.eventbox,
  }) : super(const GetEventsState.initial());
  final EventsUseCases useCases;
  final Box<EventsHiveModel> eventbox;

  getEvents() async {
    emit(const GetEventsState.loading());
    try {
      final data = await useCases.getEvents();
      emit(GetEventsState.success(data));
    } catch (e) {
      emit(GetEventsState.error(e.toString()));
    }
  }

  changeStatus(int index, EventsHiveModel model) {
    emit(const GetEventsState.loading());
    eventbox.putAt(
      index,
      EventsHiveModel(
        eventId: model.eventId,
        eventText: model.eventText,
        eventTitle: model.eventTitle,
        eventPictures: model.eventPictures,
        eventReadStatus: true,
      ),
    );
    final data = eventbox.values.toList();
    emit(GetEventsState.success(data));
  }

  filterAll() {
    emit(const GetEventsState.loading());
    final data = eventbox.values.toList();
    emit(GetEventsState.success(data));
  }

  filterUnRead() {
    emit(const GetEventsState.loading());
    final data = eventbox.values.toList();
    final filterData = data.where((element) => !element.eventReadStatus!);
    emit(GetEventsState.success(filterData.toList()));
  }

  filterRead() {
    emit(const GetEventsState.loading());
    final data = eventbox.values.toList();
    final filterData = data.where((element) => element.eventReadStatus!);
    emit(GetEventsState.success(filterData.toList()));
  }
}
