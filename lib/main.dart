// import 'package:bookmanagementsystem/view/BookIssueRequest.dart';
// import 'package:bookmanagementsystem/view/student.dart';
// import 'package:bookmanagementsystem/view/admin.dart';
// import 'package:bookmanagementsystem/view/login_view.dart';
// import 'package:bookmanagementsystem/view/register_view.dart';
// import 'package:bookmanagementsystem/view/login_view.dart';
// import 'package:bookmanagementsystem/view/student.dart';
// import 'package:bookmanagementsystem/helpers/loading/loading_screen.dart';
// import 'package:bookmanagementsystem/view/forgot_password.dart';
import 'package:bookmanagementsystem/view/forgot_password.dart';
import 'package:bookmanagementsystem/view/login_view.dart';
import 'package:bookmanagementsystem/view/register_view.dart';
import 'package:bookmanagementsystem/view/student.dart';
import 'package:bookmanagementsystem/view/verify_email.dart';
import 'package:bookmanagementsystem/view/view_Profile.dart';
import 'package:bookmanagementsystem/view/view_book.dart';
// import 'package:bookmanagementsystem/view/admin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DashBoard(),
        '/login': (context) => DashBoard(),
        '/signup': (context) => RegiterView(),
        '/forgotpassword': (context) => ForgotPassword(),
        '/verifyemail': (context) => VerifyEmail(),
      },


      
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// UserProfile user = UserProfile(
//     name: 'Gaurav Paliwal',
//     profilePictureUrl:
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl7cvWcPETZgFEN1zS4vNVGT7C0a8D6dM3RRZbmqKHZA&s',
//     enrollment: 210305124032,
//     email: 'abc@xyz.com',
//     section: '5B1',
//     showBook: [
//       Book(
//           title: "Build Don't Talk",
//           author: "Raj Shamani",
//           imageUrl:
//               "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"),
//       Book(
//           title: "Can't Hurt Me",
//           author: "David Goggins",
//           imageUrl:
//               "https://m.media-amazon.com/images/I/61pDNU9qEGL._SL1360_.jpg"),
//     ]);

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return ForgotPassword();
//   }
// }
