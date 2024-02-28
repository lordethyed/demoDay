import 'package:demo_day/features/events/presentation/events_list_page.dart';
import 'package:demo_day/features/records/presentation/records_page.dart';
import 'package:demo_day/features/tickets/presentation/tickets_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> _bottomNavigationBarItems =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Text('Events'),
      label: '',
      activeIcon: Text(
        'Events',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Text('Tickets'),
      label: '',
      activeIcon: Text(
        'Tickets',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Text('Records'),
      label: '',
      activeIcon: Text(
        'Records',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    ),
  ];

  final List<Widget> _pages = const [
    EventsListPage(),
    TicketsListPage(),
    RecordsPage(),
  ];

  int _currentIndex = 0;

  _changeTheIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _bottomNavigationBarItems,
        currentIndex: _currentIndex,
        onTap: _changeTheIndex,
      ),
    );
  }
}
