import 'package:bookmanagementsystem/constants/constants.dart';
import 'package:bookmanagementsystem/view/request_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Product {
  String imageUrl, title, author;
  int id , qty;
  Product({
   
    required this.author,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.qty,
  });
}
List<Product> product = [
  Product(
    id : 1,
   title: "Can't Hurt Me",
          author: "David Goggins",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg",
              qty: 0,
  ),
  Product(
    qty : 10,
    id : 2,
      title: "Physics",
          author: "H.C. Verma",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"),
  Product(
    qty : 7,
    id: 3,
     title: "Can't Hurt Me",
          author: "David Goggins",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"
  ),
    Product(
    qty : 10,
    id : 4,
      title: "Can't Hurt Me",
          author: "David Goggins",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"),
  Product(
    qty : 7,
    id: 5,
     title: "Can't Hurt Me",
          author: "David Goggins",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"
  ),  Product(
    qty : 10,
    id : 6,
      title: "Can't Hurt Me",
          author: "David Goggins",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"),
  Product(
    qty : 7,
    id: 7,
     title: "Can't Hurt Me",
          author: "David Goggins",
          imageUrl:
              "https://m.media-amazon.com/images/I/71dA6xPmp3L._AC_UF1000,1000_QL80_.jpg"
  ),

 
];

class StudentPanelBody extends StatefulWidget {
  const StudentPanelBody({super.key});

  @override
  State<StudentPanelBody> createState() => StudentPanelBodyState();
}

class StudentPanelBodyState extends State<StudentPanelBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: GridView.builder(
        gridDelegate: const   SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: kDefaultPadding,
          mainAxisSpacing: kDefaultPadding,        
          childAspectRatio: 0.75, crossAxisCount: 4,
                    
        ),
        itemCount: product.length, // Provide itemCount
        itemBuilder: (context, index) => ItemCard(product: product[index]),
      ),
    );
  }
}
class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    DateTime selectedIssueDate = DateTime.now(); // Initialize with the current date/time

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
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              "Title: ${product.title}",
              style: GoogleFonts.robotoMono(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              "Author: ${product.author}",
              style: GoogleFonts.robotoMono(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              "Availability: ${product.qty}",
              style: GoogleFonts.robotoMono(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (product.qty > 0)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: (){
                      print("Redirecting ...");
                    },
                    child: Text(
                      "Select Issue Date",
                      style: GoogleFonts.robotoMono(fontSize: 16),
                    ),
                  ),
                  Text(
                    "Selected Issue Date: ${selectedIssueDate.toLocal()}".split(' ')[0],
                    style: GoogleFonts.robotoMono(fontSize: 16),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () {
                      print("Redirecting... ");
                    },
                    child: const Text("Request Book"),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
              child: ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.grey,
                ),
                child: const Text("Request Book"),
              ),
            )
        ],
      ),
    );
  }
}
