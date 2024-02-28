import 'package:demo_day/features/events/data/models/static/events_hive_model.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key, required this.model});
  final EventsHiveModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
            Text(model.eventTitle ?? ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 110,
                  width: 110,
                  child: Image.asset(
                      'assets/images/${model.eventPictures![0]}'),
                ),
                SizedBox(
                  height: 110,
                  width: 110,
                  child: Image.asset(
                      'assets/images/${model.eventPictures![1]}'),
                ),
                SizedBox(
                  height: 110,
                  width: 110,
                  child: Image.asset(
                      'assets/images/${model.eventPictures![2]}'),
                ),
              ],
            ),
            Text(model.eventText ?? ''),
                    ],
                  ),
          )),
    );
  }
}
