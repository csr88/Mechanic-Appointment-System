import 'package:flutter/material.dart';

import '../mainscreens/login.dart';
import 'appointments.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 153, 237, 210),
            Color.fromARGB(255, 86, 228, 183),
            Color.fromARGB(255, 20, 123, 90)
          ])),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 153, 237, 210),
                    Color.fromARGB(255, 86, 228, 183),
                    Color.fromARGB(255, 20, 123, 90),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your Name', // Replace with the user's name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                // Navigate to the dashboard page (same page)
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Appointments'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Navigate to the login page and remove all previous routes
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => login()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}
