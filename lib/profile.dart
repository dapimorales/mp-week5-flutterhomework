import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final String userName = "Maulana Khadafi";
  final String role = "Mahasiswa Teknik Informatika";

  final List<String> experiences = [
    "Frontend Developer - Makanda",
    "Frontend Developer - Website Laundry Laravel",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(height: 16),
            ProfileInfo(userName: userName, role: role),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Fitur Edit belum tersedia saat ini."),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
            ),
            const SizedBox(height: 24),
          
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text('15', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                      const SizedBox(height: 4),
                      Text('Proyek', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Column(
                    children: [
                      const Text('1.2K', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                      const SizedBox(height: 4),
                      Text('Followers', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Column(
                    children: [
                      const Text('42', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                      const SizedBox(height: 4),
                      Text('Following', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ],
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

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey,
      child: Icon(Icons.person, size: 50, color: Colors.white),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String userName;
  final String role;
  const ProfileInfo({super.key, required this.userName, required this.role});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(userName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Text(role, style: TextStyle(fontSize: 16, color: Colors.grey[700]), textAlign: TextAlign.center),
      ],
    );
  }
}