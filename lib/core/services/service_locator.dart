import 'package:demo_day/features/events/data/datasource/assets/events_assets_datasource.dart';
import 'package:demo_day/features/events/data/models/static/events_hive_model.dart';
import 'package:demo_day/features/events/domain/repositories/events_repository.dart';
import 'package:demo_day/features/events/domain/usecases/events_usecases.dart';
import 'package:demo_day/features/events/presentation/cubit/get_events_cubit.dart';
import 'package:demo_day/features/tickets/data/models/ticket_hive_model.dart';
import 'package:demo_day/features/tickets/presentation/cubit/get_tickets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(EventsHiveModelAdapter());
  Hive.registerAdapter(TicketHiveModelAdapter());

  final eventBox = await Hive.openBox<EventsHiveModel>('eventBox');
  final ticketBox = await Hive.openBox<TicketHiveModel>('ticketBox');
  if (ticketBox.isEmpty) {
    ticketBox.add(TicketHiveModel(
      name: 'Olzhas',
      seat: "17A",
      isOpeningCeremony: true,
    ));
    ticketBox.add(TicketHiveModel(
      name: 'Bakhytzhan Agai',
      seat: "18A",
      isOpeningCeremony: false,
    ));
  }
  sl.registerLazySingleton(() => eventBox);
  sl.registerLazySingleton(() => ticketBox);

  sl.registerLazySingleton<EventsAssetsDataSource>(
    () => EventsAssetsDataSourceImpl(),
  );

  sl.registerLazySingleton<EventsRepository>(
    () => EventsRepositoryImpl(
      assetsDataSource: sl(),
      eventBox: sl(),
    ),
  );

  sl.registerLazySingleton<EventsUseCases>(
    () => EventsUseCasesImpl(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<GetEventsCubit>(
    () => GetEventsCubit(
      useCases: sl(),
      eventbox: sl(),
    ),
  );
  sl.registerLazySingleton<GetTicketsCubit>(
    () => GetTicketsCubit(
      ticketBox: sl(),
    ),
  );
}
