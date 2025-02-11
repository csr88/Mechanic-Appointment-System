import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/customColors.dart';
import '../utils/hexColors.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool _isEmailValid = false;
  bool _isNameValid = false;
  bool _isAgeValid = false;
  bool _isPhoneNumberValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
    _nameController.addListener(_validateName);
    _ageController.addListener(_validateAge);
    _phoneNumberController.addListener(_validatePhoneNumber);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final isValid = EmailValidator.validate(_emailController.text);
    setState(() {
      _isEmailValid = isValid;
    });
  }

  void _validateName() {
    final name = _nameController.text;
    setState(() {
      _isNameValid = name.isNotEmpty;
    });
  }

  void _validateAge() {
    final age = _ageController.text;
    // You can add more complex age validation logic here if needed.
    setState(() {
      _isAgeValid = age.isNotEmpty;
    });
  }

  void _validatePhoneNumber() {
    final phoneNumber = _phoneNumberController.text;
    // You can add more complex phone number validation logic here if needed.
    setState(() {
      _isPhoneNumberValid = phoneNumber.isNotEmpty;
    });
  }

  bool get _isFormValid =>
      _isEmailValid &&
      _isNameValid &&
      _isAgeValid &&
      _isPhoneNumberValid &&
      (_passwordController.text?.length ?? 0) >= 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 153, 237, 210),
              Color.fromARGB(255, 86, 228, 183),
              Color.fromARGB(255, 20, 123, 90),
            ],
          ),
        ),
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
                          Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              color: CustomColors.primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
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
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          hintText: "Enter the Email",
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          errorStyle: GoogleFonts.poppins(
                            color: CustomColors.errorColor,
                          ),
                          fillColor: HexColor('#F4F3F3').withOpacity(0.5),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: HexColor('#F4F3F3'),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(255, 20, 123, 90),
                          ),
                        ),
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
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          hintText: "Enter the Password",
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          errorStyle: GoogleFonts.poppins(
                            color: CustomColors.errorColor,
                          ),
                          fillColor: HexColor('#F4F3F3').withOpacity(0.5),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: HexColor('#F4F3F3'),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.key_rounded,
                            color: Color.fromARGB(255, 20, 123, 90),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          label: const Text('Name'),
                          labelStyle: GoogleFonts.poppins(
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          hintText: "Enter the Name",
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          errorStyle: GoogleFonts.poppins(
                            color: CustomColors.errorColor,
                          ),
                          fillColor: HexColor('#F4F3F3').withOpacity(0.5),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: HexColor('#F4F3F3'),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_2_outlined,
                            color: Color.fromARGB(255, 20, 123, 90),
                          ),
                        ),
                        validator: (value) {
                          if (!_isNameValid) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                    ),

                    // Age Field
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                      child: TextFormField(
                        controller: _ageController,
                        decoration: InputDecoration(
                          label: const Text('Age'),
                          labelStyle: GoogleFonts.poppins(
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          hintText: "Enter the Age",
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          errorStyle: GoogleFonts.poppins(
                            color: CustomColors.errorColor,
                          ),
                          fillColor: HexColor('#F4F3F3').withOpacity(0.5),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: HexColor('#F4F3F3'),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.app_registration_rounded,
                            color: Color.fromARGB(255, 20, 123, 90),
                          ),
                        ),
                        validator: (value) {
                          if (!_isAgeValid) {
                            return 'Age is required';
                          }
                          return null;
                        },
                      ),
                    ),

                    // Phone Number Field
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                      child: TextFormField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          label: const Text('Phone Number'),
                          labelStyle: GoogleFonts.poppins(
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          hintText: "Enter the Phone-Number",
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          errorStyle: GoogleFonts.poppins(
                            color: CustomColors.errorColor,
                          ),
                          fillColor: HexColor('#F4F3F3').withOpacity(0.5),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: HexColor('#F4F3F3'),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 20, 123, 90),
                          ),
                        ),
                        validator: (value) {
                          if (!_isPhoneNumberValid) {
                            return 'Phone Number is required';
                          }
                          return null;
                        },
                      ),
                    ),

                    // Signup Button
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _isFormValid
                          ? () {
                              // Perform signup logic here if the form is valid
                            }
                          : null, // Disable button if the form is not valid
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Sign Up',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.poppins(
                              color: CustomColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
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
