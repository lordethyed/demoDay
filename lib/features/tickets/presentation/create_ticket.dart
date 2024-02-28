import 'package:flutter/material.dart';

class CreateTicket extends StatefulWidget {
  const CreateTicket({super.key});

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  String dropdownValue = "OpeningCeremony";
  TextEditingController _nameController = TextEditingController();
  TextEditingController _seatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Ticket'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          DropdownButton(
              value: dropdownValue,
              items: <String>['OpeningCeremony', 'ClosingCeremony']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 30),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              }),
          TextField(
            decoration: const InputDecoration(hintText: 'Name'),
            controller: _nameController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Seat'),
            controller: _seatController,
          ),
        ],
      )),
    );
  }
}
