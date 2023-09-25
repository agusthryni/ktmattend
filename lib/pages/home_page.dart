import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ktmattend/pages/profile.page.dart';

import '../components/drawer.dart';
import 'add_card_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // user
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  // navigate to add card page
  void goToAddCardPage() {
    // pop menu drawer
    Navigator.pop(context);

    // go to add card page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddCardPage(),
      ),
    );
  }

  // navigate to profile page
  void goToProfilePage() {
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("KTMAttend"),
        backgroundColor: Colors.grey[900],
        actions: [
          // add card scan button
          IconButton(
            onPressed: goToAddCardPage,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOutTap: signUserOut,
      ),
      body: const Column(
        children: [
          // the wall

          // logged in as
          Text("."),
        ],
      ),
    );
  }
}
