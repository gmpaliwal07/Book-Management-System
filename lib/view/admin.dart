import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  void handleBookIssueRequestTap() {
    // Handle Book Issue Request tap functionality here
    print('Book Issue Request tapped');
    // Add your custom logic for Book Issue Request here
  }

  void handleManageBooksTap() {
    // Handle Manage Books tap functionality here
    print('Manage Books tapped');
    // Add your custom logic for Manage Books here
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
            onTap: handleBookIssueRequestTap, // Assign the onTap callback
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
            onTap: handleManageBooksTap, // Assign the onTap callback
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Manage Books",
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
