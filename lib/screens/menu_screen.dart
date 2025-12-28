import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:facebook_clone/services/auth_service.dart';
import 'login_screen.dart';

class MenuScreen extends StatelessWidget {
   MenuScreen({super.key});
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      color: Colors.grey[100],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Menu", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                   const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(user?.displayName ?? "Facebook User", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                       const Text("See your profile", style: TextStyle(color: Colors.grey)),
                     ],
                  )
                ],
              ),
              const Divider(),
              const Text("All shortcuts", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildMenuCard(Icons.history, "Memories", Colors.blue),
                  _buildMenuCard(Icons.bookmark, "Saved", Colors.purple),
                  _buildMenuCard(Icons.groups, "Groups", Colors.blue),
                  _buildMenuCard(Icons.ondemand_video, "Video", Colors.blue),
                  _buildMenuCard(Icons.storefront, "Marketplace", Colors.blue),
                  _buildMenuCard(Icons.people, "Friends", Colors.blue),
                  _buildMenuCard(Icons.event, "Events", Colors.red),
                  _buildMenuCard(Icons.settings, "Settings", Colors.grey),
                ],
              ),
               const SizedBox(height: 20),
              _buildExpandableItem(Icons.help, "Help & Support"),
               _buildExpandableItem(Icons.settings, "Settings & Privacy"),
               const SizedBox(height: 20),
               ElevatedButton(
                  onPressed: () async {
                    await _authService.signOut();
                    if (context.mounted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    minimumSize: const Size(double.infinity, 50),
                    elevation: 0,
                  ),
                  child: const Text('Log Out', style: TextStyle(color: Colors.black)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(IconData icon, String label, Color color) {
    return Container(
      width: 170, // Approximate half width
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildExpandableItem(IconData icon, String title) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 2),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
