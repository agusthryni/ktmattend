import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // user
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: Colors.grey[900],
        ),
        body: ListView(
          children: [
            const SizedBox(height: 50),
            // profile picture
            const Icon(
              Icons.person,
              size: 72,
            ),

            const SizedBox(height: 10),

            // user email
            Text(
              currentUser.email!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ));
  }
}
