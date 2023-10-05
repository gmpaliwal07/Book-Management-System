

import 'package:bookmanagementsystem/constants/constants.dart';
import 'package:bookmanagementsystem/main.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  final Product product;

  RequestPage({required this.product, required student});

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  late DateTime _issueDate;
  late DateTime _returnDate;

  @override
  void initState() {
    super.initState();
    // Set initial values for issue date and return date (e.g., today and 7 days from today)
    _issueDate = DateTime.now();
    _returnDate = DateTime.now().add(Duration(days: 7));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Book Title: ${widget.product.title}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Text(
              "Author: ${widget.product.author}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Divider(
              height: kDefaultPadding,
              color: Colors.black,
            ),
            Text(
              "Issue Date:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: _issueDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (selectedDate != null && selectedDate != _issueDate) {
                  setState(() {
                    _issueDate = selectedDate;
                  });
                }
              },
              child: Text(
                "${_issueDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Return Date:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: _returnDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (selectedDate != null && selectedDate != _returnDate) {
                  setState(() {
                    _returnDate = selectedDate;
                  });
                }
              },
              child: Text(
                "${_returnDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement book request logic here
                print("Book request submitted");
                print("Issue Date: $_issueDate");
                print("Return Date: $_returnDate");
              },
              child: Text("Submit Request"),
            ),
          ],
        ),
      ),
    );
  }
}
