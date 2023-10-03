import 'package:flutter/material.dart';

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
    print("view Profile");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 61, 54, 54),
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
                ),
              ),
            ),
          ),
          InkWell(
            onTap: requestBook, // line 11
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Book Issue Request",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xfff5f5f5),
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
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}
