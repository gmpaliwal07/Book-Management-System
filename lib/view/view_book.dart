import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Book {
  final String title;
  final String author;
  final int availableQuantity;
  final double price;
  final String imageUrl;

  Book(this.title, this.author, this.availableQuantity, this.price,
      this.imageUrl);
}

class ViewBook extends StatefulWidget {
  const ViewBook({super.key});

  @override
  State<ViewBook> createState() => _ViewBookState();
}

class _ViewBookState extends State<ViewBook> {
  final List<Book> books = [
    Book("Book 1", "Author 1", 10, 19.99,
        "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"),
    Book("Book 2", "Author 2", 0, 14.99,
        "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"),
    Book("Book 3", "Author 3", 3, 24.99,
        "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 231, 238),
      appBar: AppBar(
          backgroundColor: const Color(0xff4B6CD0),
          title: Text(
            "Books",
            style: GoogleFonts.robotoMono(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),

          )),
          body: Column(
            children: [
              
            ],
          ),
    );
  }
}
