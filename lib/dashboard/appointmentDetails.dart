import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/customColors.dart';
import '../utils/hexColors.dart';

class AppointmentDetailPage extends StatefulWidget {
  @override
  _AppointmentDetailPageState createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  // Sample list of mechanics and locations (you can replace it with your data)
  final List<String> mechanics = ['One', 'Two', 'Three'];
  final List<String> locations = ['1', '2', '3'];

  String selectedMechanic = 'One'; // Initial mechanic selection
  String selectedLocation = '1'; // Initial location selection

  TextEditingController timeController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    timeController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 153, 237, 210),
            Color.fromARGB(255, 86, 228, 183),
            Color.fromARGB(255, 20, 123, 90)
          ])),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 153, 237, 210),
          Color.fromARGB(255, 86, 228, 183),
          Color.fromARGB(255, 20, 123, 90)
        ])),
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 80),
        child: Card(
          color: Colors.white.withOpacity(0.5),
          elevation: 5,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Appointment Details',
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: CustomColors.primaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: HexColor('#F4F3F3').withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton<String>(
                    value: selectedMechanic,
                    onChanged: (newValue) {
                      setState(() {
                        selectedMechanic = newValue!;
                      });
                    },
                    items:
                        mechanics.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: HexColor('#F4F3F3').withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton<String>(
                    value: selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        selectedLocation = newValue!;
                      });
                    },
                    items:
                        locations.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: HexColor('#F4F3F3').withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton<String>(
                    hint: const Text('Select Time'),
                    value: selectedMechanic,
                    onChanged: (newValue) {
                      setState(() {
                        selectedMechanic = newValue!;
                      });
                    },
                    items:
                        mechanics.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: HexColor('#F4F3F3').withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: Text('Name'),
                      labelStyle: GoogleFonts.poppins(
                        color: CustomColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                      ),
                      hintText: 'Enter the Name',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Update appointment logic here
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Update',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Delete appointment logic here
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Delete',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
