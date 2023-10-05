import 'package:bookmanagementsystem/services/auth/bloc/auth_bloc.dart';
import 'package:bookmanagementsystem/services/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Book {
  final String title;
  final String author;
  final String imageUrl;
  Book({required this.title, required this.author, required this.imageUrl});
}

class UserProfile {
  String name;
  String profilePictureUrl;
  int enrollment;
  String email;
  String section;
  List<Book> showBook;

  UserProfile({
    required this.name,
    required this.profilePictureUrl,
    required this.enrollment,
    required this.email,
    required this.section,
    required this.showBook,
  });
}

class ViewProfile extends StatefulWidget {
  final UserProfile userProfile;

  ViewProfile({required this.userProfile});

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  void _nextBook() {
    if (_currentPageIndex < widget.userProfile.showBook.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex++;
      });
    }
  }

  void _backBook() {
    if (_currentPageIndex >= 1) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex--;
      });
    }
  }

  Widget _buildLabel(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          labelText,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            shadows: [
              Shadow(
                color: Colors.grey[400]!,
                blurRadius: 8.0,
                offset: const Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Your Profile",
          style: GoogleFonts.robotoMono(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: const Color(0xfff5f5f5),
          ),
        ),
        backgroundColor: const Color(0xff4B6CD0),
      ),
      // backgroundColor: const Color(0xffe4f1ff),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe4f1ff),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 70.0),
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(widget.userProfile.profilePictureUrl),
                    radius: 60.0,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    widget.userProfile.name,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _buildLabel("Email: ${widget.userProfile.email}"),
                  _buildLabel("Section: ${widget.userProfile.section}"),
                  _buildLabel("Enrollment: ${widget.userProfile.enrollment}"),
                  const SizedBox(height: 20.0),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     print("Redirecting to edit profile section");
                  //   },
                  //   child: const Text('Edit Profile'),
                  // ),
                  ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(327, 50),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  shadowColor:
                                      const Color.fromARGB(255, 179, 200, 247),
                                  elevation: 30,
                                  backgroundColor: const Color(0xff4B6CD0),
                                ),
                                onPressed: () async{   
                                  context.read<AuthBloc>().add(const AuthEventLogOut());
                                      
                                },
                                child: Text('Log Out',
                                    style: GoogleFonts.robotoMono(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800)),
                              ),
                              
                ],
              ),
            ),
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 61, 54, 54),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  const Text(
                    "Issued Books",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Center(
                    child: SizedBox(
                      height: 350.0,
                      width: 350.0,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.userProfile.showBook.length,
                        itemBuilder: (BuildContext context, int index) {
                          final book = widget.userProfile.showBook[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.network(
                                  book.imageUrl,
                                  width: 200.0,
                                  height: 200.0,
                                ),
                                Text(
                                  book.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Author: ${book.author}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        onPageChanged: (int pageIndex) {
                          setState(() {
                            _currentPageIndex = pageIndex;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 210),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: _backBook,
                          icon: const Icon(Icons.arrow_back_ios_new),
                        ),
                        IconButton(
                          onPressed: _nextBook,
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
