import 'package:demo_day/features/events/data/models/static/events_hive_model.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  const EventTile({super.key, required this.model});
  final EventsHiveModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            height: 110,
            child: Image.asset('assets/images/${model.eventPictures!.first}'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  model.eventTitle ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  model.eventText ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(model.eventReadStatus! ? "Read" : "Unread"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
