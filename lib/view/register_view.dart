import 'package:bookmanagementsystem/services/auth/auth_exceptions.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth.state.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_bloc.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_event.dart';
import 'package:bookmanagementsystem/utilities/dialogs/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async{
      if(state is AuthStateRegistring) {
        if(state.exception is WeakPasswordAuthException) {
          await showErrorDialog(context, "Weak Password");
        }else if (state.exception is EmailAlreadyUseAuthException) {
          await showErrorDialog(context, "Email Already in Use");
        }else if(state.exception is InvalidEmailAuthException) {
          await showErrorDialog(context, "Email is Invalid");
        }else if( state.exception is NetworkRequestFailAuthException) {
          await showErrorDialog(context, "Connect to Internet");
        }else if(state.exception is GenericAuthException) {
          await showErrorDialog(context, "Failed to Register");
        }
      }
      },
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 217, 231, 238),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xff4B6CD0),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage('images/book.png'),
                  width: 60,
                  height: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Book Management System",
                  style: GoogleFonts.robotoMono(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                        padding: const EdgeInsets.all(95),
                        child: Center(
                          child: Column(children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Register",
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
                                "Register with credentials",
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
                              controller: _email,
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
                            TextField(
                              obscureText: isPasswordVisible,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: _password,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(20.0),
                                  hintText: "Enter Password",
                                  prefixIcon: const Icon(Icons.lock_rounded),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() => isPasswordVisible =
                                            !isPasswordVisible);
                                      },
                                      icon: isPasswordVisible
                                          ? const Icon(
                                              Icons.visibility_off_rounded)
                                          : const Icon(
                                              Icons.visibility_rounded)),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  fillColor: Colors.white,
                                  focusColor: const Color(0xff4B6CD0),
                                  filled: true),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(327, 50),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  shadowColor:
                                      const Color.fromARGB(255, 179, 200, 247),
                                  elevation: 30,
                                  backgroundColor: const Color(0xff4B6CD0),
                                ),
                                onPressed: () async{
                                  final email = _email.text;
                                  final password = _password.text;
                                  context
                                      .read<AuthBloc>()
                                      .add(AuthEventRegister(
                                        email,
                                        password,
                                      ));
                                },
                                child: Text('Register',
                                    style: GoogleFonts.robotoMono(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800)),
                              ),
                              
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: () async{
                                    context
                                        .read<AuthBloc>()
                                        .add(const AuthEventLogOut());
                                  },
                                  child: Text(
                                    "Back to Login",
                                    style: GoogleFonts.robotoSlab(
                                        fontSize: 15,
                                        color: Colors.grey.shade800),
                                  )),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.5,
                      child: Lottie.asset('animations/login_view.json'),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
