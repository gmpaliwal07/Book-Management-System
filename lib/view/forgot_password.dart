import 'package:bookmanagementsystem/services/auth/bloc/auth.state.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_bloc.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_event.dart';
import 'package:bookmanagementsystem/utilities/dialogs/error_dialog.dart';
import 'package:bookmanagementsystem/utilities/dialogs/password_reset_email_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late final TextEditingController _controller;
  

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async{
        if(state is AuthStateForgotPassword) {
             if (state.hasSentEmail) {
            await showPasswordResetSentDialog(context);
          }
          if (state.exception != null) {
            // ignore: use_build_context_synchronously
            await showErrorDialog(context,
                "We could not process request at this time Try again later.");
          }
        }
      },
      child: Scaffold(
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
                                "Forgot Password !!",
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
                                "If you Forgot Password then Enter your E-mail and we will send you a link to reset your password",
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
                              height: 20,
                            ),
                            TextField(
                              controller: _controller,
                              enableSuggestions: false,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.alternate_email_rounded),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                contentPadding: EdgeInsets.all(20.0),
                                fillColor: Colors.white,
                                hintText: "Enter e-mail",
                                filled: true,
                                focusColor: Color(0xff4B6CD0),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(327, 50),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    shadowColor: const Color.fromARGB(
                                        255, 179, 200, 247),
                                    elevation: 30,
                                    backgroundColor: const Color(0xff4B6CD0)),
                                onPressed: () {
                                  final email = _controller.text;
                                  context.read<AuthBloc>().add(
                                      AuthEventForgotPassword(email: email));
                                },
                                child: Text('Send Link',
                                    style: GoogleFonts.robotoMono(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800)),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                 context.read<AuthBloc>().add(const AuthEventLogOut());
                                },
                                child: Text(
                                  "Back to Login",
                                  style: GoogleFonts.robotoSlab(
                                      fontSize: 15,
                                      color: Colors.grey.shade800),
                                )),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.5,
                      child: Lottie.asset('animations/forgot_password.json'),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
