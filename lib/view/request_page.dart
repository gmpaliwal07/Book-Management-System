import 'dart:convert';
import 'dart:io';
import 'package:bookmanagementsystem/Models/book.dart';
import 'package:bookmanagementsystem/constants/api.dart';
import 'package:bookmanagementsystem/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class RequestBookScreen extends StatefulWidget {
  const RequestBookScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RequestBookScreenState createState() => _RequestBookScreenState();
}

class _RequestBookScreenState extends State<RequestBookScreen> {
  final TextEditingController enrollmentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController name = TextEditingController();
  DateTime? issueDate;
  DateTime? returnDate;
  Book? selectedBook;
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(bookapi));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          books = data
              .map((item) => Book(
                    id: item['id'],
                    title: item['title'],
                    author: item['author'],
                    imageUrl: item['imageUrl'],
                  ))
              .toList();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> generateAndOpenPDF() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Enrollment: ${enrollmentController.text}'),
            pw.Text('Email: ${emailController.text}'),
            if (selectedBook != null)
              pw.Text('Title: ${selectedBook!.title}'),
            if (selectedBook != null)
              pw.Text('Author: ${selectedBook!.author}'),
            pw.Text('Issue Date: ${issueDate?.toLocal()}'),
            pw.Text('Return Date: ${returnDate?.toLocal()}'),
          ],
        );
      },
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File('${output.path}/request.pdf');
  await file.writeAsBytes(await pdf.save());

  // Open the generated PDF using flutter_pdfview
  // ignore: use_build_context_synchronously
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PDFView(
        filePath: file.path,
        enableSwipe: true,
        swipeHorizontal: false,
      ),
    ),
  );
}

  Future<void> _selectDate(BuildContext context, bool isIssueDate) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != (isIssueDate ? returnDate : issueDate)) {
      setState(() {
        if (isIssueDate) {
          issueDate = picked;
        } else {
          returnDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 231, 238),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          
          "Request Book",
          style: GoogleFonts.robotoMono(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20)),
          height: kDefaultPadding * 30,
          width: kDefaultPadding * 30,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text("Fill the Details", style: GoogleFonts.robotoMono(
                  fontSize: 20
                 ),),
const SizedBox(height: 20,),
                TextField(
                  controller: name,
                  enableSuggestions: false,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    contentPadding: EdgeInsets.all(20.0),
                    fillColor: Colors.white,
                    hintText: "Enter name",
                    filled: true,
                    focusColor: Color(0xff4B6CD0),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: enrollmentController,
                  enableSuggestions: false,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    contentPadding: EdgeInsets.all(20.0),
                    fillColor: Colors.white,
                    hintText: "Enter Enrollment",
                    filled: true,
                    focusColor: Color(0xff4B6CD0),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<Book>(
                  value: selectedBook,
                  items: books.map((book) {
                    return DropdownMenuItem<Book>(
                      value: book,
                      child: Text(
                        book.title,
                        style: GoogleFonts.robotoMono(),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBook = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Select Book'),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Issue Date: ',
                      style: GoogleFonts.robotoMono(color: kPrimaryColor),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(
                          context, true), // Corrected the onPressed function
                      child: Text(
                        issueDate != null
                            ? '${issueDate!.toLocal()}'.split(' ')[0]
                            : 'Select Date',
                        style: GoogleFonts.robotoMono(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Return Date: ',
                      style: GoogleFonts.robotoMono(color: kPrimaryColor),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(
                          context, false), // Corrected the onPressed function
                      child: Text(
                        returnDate != null
                            ? '${returnDate!.toLocal()}'.split(' ')[0]
                            : 'Select Date',
                        style: GoogleFonts.robotoMono(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {
                    generateAndOpenPDF();
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.robotoMono(fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
