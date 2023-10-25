import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ktmattend/pages/profile.page.dart';
import '../components/drawer.dart';
import '../components/navbar.dart';
import 'add_card_page.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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
        centerTitle: true,
        title: const Text("ICheck"),
        backgroundColor: Colors.green,
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
      body: Column(
        children: [
          // Absensi Masuk
          Card(
            margin: const EdgeInsets.all(16.0),
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
                  // Tambahkan tombol Absensi Masuk di sini
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
                    ),
                    child: const Text('Presensi'),
                  ),
                ],
              ),
            ),
          ),

          Card(
            margin: const EdgeInsets.all(16.0),
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
                  // Tambahkan tombol Absensi Masuk di sini
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
                    ),
                    child: const Text('Presensi'),
                  ),
                ],
              ),
            ),
          ), // Tambahkan widget lainnya di sini
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex:
            0, // Sesuaikan dengan indeks Beranda pada bottom navigation
        onItemTapped: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/home'); // Pencarian
          } else if (index == 2) {
            Navigator.pushNamed(context, '/add'); // AI
          }
        },
      ),
    );
  }
}
