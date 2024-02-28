import 'package:demo_day/core/services/service_locator.dart';
import 'package:demo_day/features/events/presentation/cubit/get_events_cubit.dart';
import 'package:demo_day/features/home/home_page.dart';
import 'package:demo_day/features/tickets/presentation/cubit/get_tickets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<GetEventsCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<GetTicketsCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Demo Day',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
