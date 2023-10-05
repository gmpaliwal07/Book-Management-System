import 'package:flutter/material.dart';

class BookRequestView extends StatelessWidget {
  final String userName;
  final String bookTitle;
  final String requestDate;

   BookRequestView({
    required this.userName,
    required this.bookTitle,
    required this.requestDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Request Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'User Name: $userName',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
           const  SizedBox(height: 8),
            Text(
              'Book Title: $bookTitle',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Request Date: $requestDate',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add functionality to approve the book request
                // You can navigate to another screen or perform other actions here
              },
              child: const Text('Approve Request'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add functionality to reject the book request
                // You can navigate to another screen or perform other actions here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text('Reject Request'),
            ),
          ],
        ),
      ),
    );
  }
}
