import 'package:bloc/bloc.dart';
import 'package:demo_day/features/tickets/data/models/ticket_hive_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'get_tickets_state.dart';
part 'get_tickets_cubit.freezed.dart';

class GetTicketsCubit extends Cubit<GetTicketsState> {
  GetTicketsCubit({required this.ticketBox})
      : super(const GetTicketsState.initial());
  final Box<TicketHiveModel> ticketBox;

  getTickets() async {
    emit(const GetTicketsState.loading());
    try {
      final data = ticketBox.values.toList();
      final openingCeremonyTickets =
          data.where((element) => element.isOpeningCeremony!);
      final closingCeremonyTickets =
          data.where((element) => !element.isOpeningCeremony!);
      emit(
        GetTicketsState.success(
          openingCeremonyTickets.toList(),
          closingCeremonyTickets.toList(),
        ),
      );
    } catch (e) {
      emit(GetTicketsState.error(e.toString()));
    }
  }
}
