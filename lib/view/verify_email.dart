import 'package:bookmanagementsystem/services/auth/bloc/auth_bloc.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  late final TextEditingController _email;

  late final TextEditingController _password;

  bool isPasswordVisible = true;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 217, 231, 238),
        body: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(
                    height: screenWidth * 0.4,
                    width: screenWidth * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(100),
                      child: Center(
                        child: Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Verify Email",
                              style: GoogleFonts.robotoMono(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "We have sent a verification on your E-mail. Please verify your E-mail to continue",
                              style: GoogleFonts.robotoMono(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(327, 50),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              shadowColor:
                                  const Color.fromARGB(255, 179, 200, 247),
                              elevation: 30,
                              backgroundColor: const Color(0xff4B6CD0),
                            ),
                            onPressed: () async{
                                context.read<AuthBloc>().add(const AuthEventLogOut());
                            },
                            child: Text('Back to Login',
                                style: GoogleFonts.robotoMono(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800)),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.5,
                    child: Lottie.asset('animations/verify_email.json'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
