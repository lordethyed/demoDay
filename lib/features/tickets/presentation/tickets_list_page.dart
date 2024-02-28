import 'package:demo_day/features/tickets/presentation/create_ticket.dart';
import 'package:demo_day/features/tickets/presentation/cubit/get_tickets_cubit.dart';
import 'package:demo_day/features/tickets/presentation/widgets/ticket_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketsListPage extends StatefulWidget {
  const TicketsListPage({super.key});

  @override
  State<TicketsListPage> createState() => _TicketsListPageState();
}

class _TicketsListPageState extends State<TicketsListPage> {
  @override
  void initState() {
    context.read<GetTicketsCubit>().getTickets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tickets List"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => CreateTicket())),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blueGrey),
              ),
              child: const Text(
                "Create a new ticket",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Text('Opening Ceremony Tickets'),
            SizedBox(
              height: 300,
              child: BlocBuilder<GetTicketsCubit, GetTicketsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    success: (state) => ListView.builder(
                      itemCount: state.openingCeremonyTickets.length,
                      itemBuilder: (context, index) => TicketTile(model: state.openingCeremonyTickets[index],),
                    ),
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
            const Text('Closing Ceremony Tickets'),
            SizedBox(
              height: 300,
              child: BlocBuilder<GetTicketsCubit, GetTicketsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    success: (state) => ListView.builder(
                      itemCount: state.closingCeremonyTickets.length,
                      itemBuilder: (context, index) => TicketTile(model: state.closingCeremonyTickets[index]),
                    ),
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
