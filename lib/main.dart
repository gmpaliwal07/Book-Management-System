
import 'package:bookmanagementsystem/constants/constants.dart';
import 'package:bookmanagementsystem/constants/routes.dart';
import 'package:bookmanagementsystem/helpers/loading/loading_screen.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth.state.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_bloc.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_event.dart';
import 'package:bookmanagementsystem/services/auth/firebase_auth_provider.dart';
import 'package:bookmanagementsystem/view/forgot_password.dart';
import 'package:bookmanagementsystem/view/login_view.dart';
import 'package:bookmanagementsystem/view/register_view.dart';
import 'package:bookmanagementsystem/view/request_page.dart';
import 'package:bookmanagementsystem/view/student.dart';

import 'package:bookmanagementsystem/view/verify_email.dart';
import 'package:bookmanagementsystem/view/view_Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AuthBloc>(
        create: (hello) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
      // routes: {
      //   login: (context) => const LoginView(),
      //   signup :(context) => const RegisterView(),
      //   forgotpassword: (context) => const ForgotPassword(), 
      // },
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     context.read<AuthBloc>().add(const AuthEventIntialize());
//     return BlocConsumer<AuthBloc, AuthState>(
//       listener: (context, state) {
//         if (state.isLoading) {
//           LoadingScreen().show(
//             context: context,
//             text: state.loadingText ?? 'Please wait...',
//           );
//         } else {
//           LoadingScreen().hide();
//         }
//       },
//       builder: (context, state) {
//         if (state is AuthStateLoggedIn) {
//           return const StudentPanel();
//         } else if (state is AuthStateUserVerification) {
//           return const VerifyEmail();
//         } else if (state is AuthStateLoggedOut) {
//           return const LoginView();
//         } else if (state is AuthStateForgotPassword) {
//           return const ForgotPassword();
//         } else if (state is AuthStateRegistring) {
//           return const RegisterView();
//         } else {
//           return Scaffold(
//             body: Center(child: Lottie.asset('assets/animations/loading.json', width: 200, height: 200,),)
//           );
//         }
//       }
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  RequestBookScreen();
  }
}