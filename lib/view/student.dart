import 'package:bookmanagementsystem/enums/menu_action.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_bloc.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_event.dart';
import 'package:bookmanagementsystem/utilities/dialogs/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentPanel extends StatefulWidget {
  const StudentPanel({super.key});

  @override
  State<StudentPanel> createState() => _StudentPanelState();
}

class _StudentPanelState extends State<StudentPanel> {
  void requestBook() {
    // Handle Book Issue Request tap functionality here
    print('Redirecting');
    // Add your custom logic for Book Issue Request here
  }

  void viewBook() {
    // Handle Manage Books tap functionality here
    print('Redirecting');
    // Add your custom logic for Manage Books here
  }

  void viewProfile() {
   Navigator.of(context).pushNamed('/profile');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 231, 238),
      appBar: AppBar(
    
        backgroundColor:const Color(0xff4B6CD0),
        title: const Text(
          'Admin Panel',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Color(0xfff5f5f5),
          ),
        ),
        actions: [
          InkWell(
            onTap: viewBook, // line no. 22
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Home",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xfff5f5f5),
                  fontSize: 20
                ),
              ),
            ),
          ),
           const SizedBox(width: 30), 
          InkWell(
            onTap: requestBook, // line 11
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Book Issue Request",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xfff5f5f5),
                   fontSize: 20
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          InkWell(
            onTap: viewProfile, // line 17
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "My Profile",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xfff5f5f5),
                   fontSize: 20
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),

           PopupMenuButton<MenuAction>(
              shadowColor: const Color.fromARGB(255, 149, 179, 244),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              onSelected: (value) async {
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogout = await showLogOutDialog(context);
                    if (shouldLogout)  {
                      // ignore: use_build_context_synchronously
                      context.read<AuthBloc>().add(const AuthEventLogOut());
                    }
                    break;
                }
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    value: MenuAction.logout,
                    child: Text("Logout"),
                  )
                ];
              },
            )
             
          ],
          
        ),

    );
  }
}
