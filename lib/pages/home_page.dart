import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ktmattend/pages/profile.page.dart';
import '../components/drawer.dart';
import '../components/navbar.dart';
import 'add_card_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  DateTime selectedDate = DateTime.now();

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToAddCardPage() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddCardPage(),
      ),
    );
  }

  void goToProfilePage() {
    Navigator.pop(context);
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
        centerTitle: true,
        title: const Text("DASHBOARD"),
        backgroundColor: const Color.fromARGB(232, 131, 176, 199),
        actions: [
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
      body: Column(
        children: [
          // User Account Card
          Card(
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL ?? ''),
              ),
              title: Text(user.displayName ?? 'User'),
              subtitle: Text(user.email ?? ''),
            ),
          ),

          // Date Selection Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed: () {
                  setState(() {
                    selectedDate =
                        selectedDate.subtract(const Duration(days: 1));
                  });
                },
              ),
              Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  setState(() {
                    selectedDate = selectedDate.add(const Duration(days: 1));
                  });
                },
              ),
            ],
          ),

          // Absensi Masuk Card
          Card(
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pengembangan Aplikasi Perangkat Bergerak',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '28 September 2023',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '07:30 AM',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddCardPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Presensi'),
                  ),
                ],
              ),
            ),
          ),

          // Deep Learning Card
          Card(
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deep Learning',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '29 September 2023',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '07:30 AM',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddCardPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Presensi'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0,
        onItemTapped: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/add');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/report');
          }
        },
      ),
    );
  }
}
