import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechanic_search/mainscreens/Signup.dart';

import '../dashboard/dashboard.dart';
import '../utils/customColors.dart';
import '../utils/hexColors.dart';

void main() {
  runApp(login());
}

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final isValid = EmailValidator.validate(_emailController.text);
    setState(() {
      _isEmailValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 153, 237, 210),
          Color.fromARGB(255, 86, 228, 183),
          Color.fromARGB(255, 20, 123, 90)
        ])),
        child: Center(
          child: Card(
            color: Colors.white.withOpacity(0.5),
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sign In',
                                style: GoogleFonts.poppins(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.07,
                                    color: CustomColors.primaryColor,
                                    fontWeight: FontWeight.w900))
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            label: const Text('Email'),
                            labelStyle: GoogleFonts.poppins(
                                color: CustomColors.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                            hintText: "Enter the Email",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                            errorStyle: GoogleFonts.poppins(
                                color: CustomColors.errorColor),
                            fillColor: HexColor('#F4F3F3').withOpacity(0.5),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: HexColor('#F4F3F3'))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            prefixIcon: const Icon(Icons.email_outlined,
                                color: Color.fromARGB(255, 20, 123, 90))),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!_isEmailValid) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            label: const Text('Password'),
                            labelStyle: GoogleFonts.poppins(
                                color: CustomColors.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                            hintText: "Enter the Password",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                            errorStyle: GoogleFonts.poppins(
                                color: CustomColors.errorColor),
                            fillColor: HexColor('#F4F3F3').withOpacity(0.5),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: HexColor('#F4F3F3'))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            prefixIcon: const Icon(Icons.key_rounded,
                                color: Color.fromARGB(255, 20, 123, 90))),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
                          // Perform login logic here
                          // If email is valid and password is at least 6 characters
                          // you can navigate to the next screen or perform other actions.
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Enter all essentials'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('Login',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.poppins(
                              color: CustomColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ));
                          },
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
