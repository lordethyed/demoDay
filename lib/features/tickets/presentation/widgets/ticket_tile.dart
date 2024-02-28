import 'package:demo_day/features/tickets/data/models/ticket_hive_model.dart';
import 'package:flutter/material.dart';

class TicketTile extends StatelessWidget {
  const TicketTile({super.key, required this.model});
  final TicketHiveModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(model.name ?? ''),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(model.seat ?? ''),
          ),
        ],
      ),
    );
  }
}
