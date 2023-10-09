import 'package:bookmanagementsystem/enums/menu_action.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_bloc.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_event.dart';
import 'package:bookmanagementsystem/utilities/dialogs/logout_dialog.dart';
import 'package:bookmanagementsystem/view/student_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title:  Text(
          'Student Panel',
          style: GoogleFonts.robotoMono(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: const Color(0xfff5f5f5),
          ),
        ),
        actions: [
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
                return  [
                  PopupMenuItem(
                    value: MenuAction.logout,
                    child: Text("Log Out", style: GoogleFonts.robotoMono(
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    ),),
                  )
                ];
              },
            )
             
          ],
          
        ),
        body: const StudentPanelBody(),
    );
  }
}
