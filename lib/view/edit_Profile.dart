import 'package:flutter/material.dart';

class UserProfile {
  String name;
  String profilePictureUrl;
  String bio;
  String email;
  String section;

  UserProfile({
    required this.name,
    required this.profilePictureUrl,
    required this.bio,
    required this.email,
    required this.section, required int enrollment, required List<dynamic> showBook,
  });
}

class EditProfile extends StatefulWidget {
  final UserProfile userProfile;

  EditProfile({required this.userProfile});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with existing user data
    nameController.text = widget.userProfile.name;
    bioController.text = widget.userProfile.bio;
    emailController.text = widget.userProfile.email;
    sectionController.text = widget.userProfile.section;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name'),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(height: 20.0),
            Text('Bio'),
            TextFormField(
              controller: bioController,
              decoration: InputDecoration(
                hintText: 'Enter your bio',
              ),
            ),
            SizedBox(height: 20.0),
            Text('Email'),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(height: 20.0),
            Text('Section'),
            TextFormField(
              controller: sectionController,
              decoration: InputDecoration(
                hintText: 'Enter your section',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Save the edited profile information
                widget.userProfile.name = nameController.text;
                widget.userProfile.bio = bioController.text;
                widget.userProfile.email = emailController.text;
                widget.userProfile.section = sectionController.text;

                // Navigate back to the profile screen
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the text controllers when not needed to prevent memory leaks
    nameController.dispose();
    bioController.dispose();
    emailController.dispose();
    sectionController.dispose();
    super.dispose();
  }
}
