
import 'package:bookmanagementsystem/constants/routes.dart';
import 'package:bookmanagementsystem/helpers/loading/loading_screen.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth.state.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_bloc.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_event.dart';
import 'package:bookmanagementsystem/services/auth/firebase_auth_provider.dart';
import 'package:bookmanagementsystem/view/forgot_password.dart';
import 'package:bookmanagementsystem/view/login_view.dart';
import 'package:bookmanagementsystem/view/register_view.dart';
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
class Product {
  String imageUrl, title, author;
  int id;
  Product({
    required this.author,
    required this.id,
    required this.imageUrl,
    required this.title,
  });
}
List<Product> product = [
  Product(
    id : 1,
   title: "Can't Hurt Me",
          author: "David Goggins",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"
  ),
  Product(
    id : 2,
      title: "Can't Hurt Me",
          author: "David Goggins",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"),
  Product(
    id: 3,
     title: "Can't Hurt Me",
          author: "David Goggins",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"
  ),

 
];
UserProfile user = UserProfile(
    name: 'Gaurav Paliwal',
    profilePictureUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl7cvWcPETZgFEN1zS4vNVGT7C0a8D6dM3RRZbmqKHZA&s',
    enrollment: 210305124032,
    email: 'abc@xyz.com',
    section: '5B1',
    showBook: [
      Book(
          title: "Build Don't Talk",
          author: "Raj Shamani",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"),
      Book(
          title: "Can't Hurt Me",
          author: "David Goggins",
          imageUrl:
              "https://m.media-amazon.com/images/I/61pDNU9qEGL._SL1360_.jpg"),
    ]);

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
      routes: {
        login: (context) => const LoginView(),
        signup :(context) => const RegisterView(),
        forgotpassword: (context) => const ForgotPassword(), 
        profile: (context) =>  ViewProfile(userProfile: user,),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventIntialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? 'Please wait...',
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const StudentPanel();
        } else if (state is AuthStateUserVerification) {
          return const VerifyEmail();
        } else if (state is AuthStateLoggedOut) {
          return const LoginView();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPassword();
        } else if (state is AuthStateRegistring) {
          return const RegisterView();
        } else {
          return Scaffold(
            body: Center(child: Lottie.asset('assets/animations/loading.json', width: 200, height: 200,),)
          );
        }
      }
    );
  }
}