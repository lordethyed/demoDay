import 'package:demo_day/features/events/presentation/cubit/get_events_cubit.dart';
import 'package:demo_day/features/events/presentation/event_details_page.dart';
import 'package:demo_day/features/events/presentation/widgets/event_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsListPage extends StatefulWidget {
  const EventsListPage({super.key});

  @override
  State<EventsListPage> createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  @override
  void initState() {
    context.read<GetEventsCubit>().getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events List"),
      ),
      body: BlocConsumer<GetEventsCubit, GetEventsState>(
        listener: (context, state) {
          state.mapOrNull(
            error: (value) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(value.message.toString()),
              ),
            ),
          );
        },
        builder: (context, state) {
          return state.maybeMap(
            success: (state) => Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () =>
                          context.read<GetEventsCubit>().filterAll(),
                      child: const Text('All'),
                    ),
                    const Text('/'),
                    TextButton(
                      onPressed: () =>
                          context.read<GetEventsCubit>().filterUnRead(),
                      child: const Text('Unread'),
                    ),
                    const Text('/'),
                    TextButton(
                      onPressed: () =>
                          context.read<GetEventsCubit>().filterRead(),
                      child: const Text('Read'),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.eventModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context
                            .read<GetEventsCubit>()
                            .changeStatus(index, state.eventModel[index]);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => EventDetailsPage(
                                model: state.eventModel[index]),
                          ),
                        );
                      },
                      child: EventTile(model: state.eventModel[index]),
                    ),
                  ),
                ),
              ],
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
