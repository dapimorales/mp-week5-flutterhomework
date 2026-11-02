import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "Maulana Khadafi";
  final String role = "Mahasiswa Teknik Informatika";

  final List<String> experiences = [
    "Frontend Developer - Makanda",
    "Frontend Developer - Website Laundry Laravel",
  ];

  void _showEditDialog() {
    TextEditingController nameController = TextEditingController(text: userName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Nama Profil"),
          content: TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Nama Lengkap",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                });
                Navigator.pop(context);
                
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profil berhasil diperbarui!")),
                );
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(height: 16),
            ProfileInfo(userName: userName, role: role),
            const SizedBox(height: 20),
            
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _showEditDialog,
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
            ),
            
            const SizedBox(height: 24),
            const ProfileStats(),
            const SizedBox(height: 24),
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pengalaman Kerja',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(),
            
            Expanded(
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  return ExperienceCard(experience: experiences[index]);
                },
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
        const SizedBox(height: 6),
        Text(role, style: TextStyle(fontSize: 16, color: Colors.grey[700]), textAlign: TextAlign.center),
      ],
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(12)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatItem(count: '15', label: 'Proyek'),
          SizedBox(width: 24),
          StatItem(count: '1.2K', label: 'Followers'),
          SizedBox(width: 24),
          StatItem(count: '42', label: 'Following'),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String count;
  final String label;
  const StatItem({super.key, required this.count, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String experience;
  const ExperienceCard({super.key, required this.experience});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.work, color: Colors.blueAccent),
        title: Text(experience),
      ),
    );
  }
}