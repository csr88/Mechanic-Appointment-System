import 'package:flutter/material.dart';

import 'appointmentDetails.dart';

class AppointmentPage extends StatelessWidget {
  // Sample list of appointments (you can replace it with your data)
  final List<String> appointments = [
    'Appointment 1',
    'Appointment 2',
    'Appointment 3',
    'Appointment 4',
    'Appointment 5',
    'Appointment 6',
    'Appointment 7',
    'Appointment 8',
    'Appointment 9',
    'Appointment 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 153, 237, 210),
            Color.fromARGB(255, 86, 228, 183),
            Color.fromARGB(255, 20, 123, 90)
          ])),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 153, 237, 210),
            Color.fromARGB(255, 86, 228, 183),
            Color.fromARGB(255, 20, 123, 90)
          ])),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Your appointment list
              ListView.builder(
                shrinkWrap: true,
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppointmentDetailPage()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                      child: Card(
                        color: Colors.white.withOpacity(0.5),
                        elevation: 5,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          title: Text(appointments[index]),
                          // You can add more appointment details here
                          subtitle: Text('Appointment Details'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
