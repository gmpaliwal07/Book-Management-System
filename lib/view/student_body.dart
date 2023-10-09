import 'dart:convert';
import 'package:bookmanagementsystem/constants/api.dart';
import 'package:bookmanagementsystem/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../Models/book.dart'; // Import your Book class here

class StudentPanelBody extends StatefulWidget {
  const StudentPanelBody({Key? key}) : super(key: key);

  @override
  State<StudentPanelBody> createState() => StudentPanelBodyState();
}

class StudentPanelBodyState extends State<StudentPanelBody> {
  List<Book> books = [];

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(bookapi));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          books = data.map((item) => Book(
            id: item['id'],
            title: item['title'],
            author: item['author'],
            imageUrl: item['imageUrl'],
            // You can add more properties here if needed
          )).toList();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: kDefaultPadding,
          mainAxisSpacing: kDefaultPadding,
          childAspectRatio: 0.75,
          crossAxisCount: 4,
        ),
        itemCount: books.length, // Use the books list
        itemBuilder: (context, index) => ItemCard(book: books[index]), // Pass a Book object
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                book.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              "Title: ${book.title}",
              style: GoogleFonts.robotoMono(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              "Author: ${book.author}",
              style: GoogleFonts.robotoMono(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/request',
                arguments: {
                  'author': book.author,
                  'title': book.title,
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
            ),
            child: const Text("Request Book"),
          ),
        ],
      ),
    );
  }
}
