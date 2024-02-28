part of 'get_events_cubit.dart';

@freezed
class GetEventsState with _$GetEventsState {
  const factory GetEventsState.initial() = _Initial;
  const factory GetEventsState.loading() = _Loading;
  const factory GetEventsState.success(List<EventsHiveModel> eventModel) = _Success;
  const factory GetEventsState.error(String message) = _Error;
}
