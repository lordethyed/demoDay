part of 'get_tickets_cubit.dart';

@freezed
class GetTicketsState with _$GetTicketsState {
  const factory GetTicketsState.initial() = _Initial;
  const factory GetTicketsState.loading() = _Loading;
  const factory GetTicketsState.success(List<TicketHiveModel> openingCeremonyTickets, List<TicketHiveModel> closingCeremonyTickets) = _Success;
  const factory GetTicketsState.error(String message) = _Error;
}
