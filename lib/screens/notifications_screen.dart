import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildSectionHeader("New"),
          _buildNotificationItem(
            name: "John Doe",
            content: "commented on your photo.",
            time: "25 minutes ago",
            isNew: true,
            icon: Icons.comment,
            iconColor: Colors.blue,
             profileImage: "https://picsum.photos/100?random=401",
          ),
          _buildNotificationItem(
            name: "Groups",
            content: "New post in Flutter Developers.",
            time: "1 hour ago",
             isNew: true,
             icon: Icons.groups,
             iconColor: Colors.blue,
              profileImage: "https://picsum.photos/100?random=402",
          ),
           _buildNotificationItem(
            name: "Event Reminder",
            content: "You have an event tomorrow: 'Team Meeting'.",
            time: "2 hours ago",
             isNew: true,
             icon: Icons.event,
             iconColor: Colors.red,
              profileImage: "https://picsum.photos/100?random=403",
          ),
          _buildSectionHeader("Earlier"),
          _buildNotificationItem(
            name: "Jane Smith",
            content: "sent you a friend request.",
            time: "Yesterday",
             isNew: false,
             icon: Icons.person_add,
             iconColor: Colors.blue,
              profileImage: "https://picsum.photos/100?random=404",
          ),
          _buildNotificationItem(
            name: "Marketplace",
            content: "Recommended for you: 'MacBook Pro 2021'.",
             time: "2 days ago",
             isNew: false,
             icon: Icons.storefront,
             iconColor: Colors.green,
              profileImage: "https://picsum.photos/100?random=405",
          ),
           _buildNotificationItem(
            name: "System",
            content: "Please update your security settings.",
             time: "3 days ago",
             isNew: false,
             icon: Icons.security,
             iconColor: Colors.grey,
              profileImage: null, 
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Notifications", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            child: const Icon(Icons.search, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _buildNotificationItem({
    required String name,
    required String content,
    required String time,
    required bool isNew,
    required IconData icon,
    required Color iconColor,
    String? profileImage,
  }) {
    return Container(
      color: isNew ? Colors.blue.withOpacity(0.1) : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: profileImage != null ? NetworkImage(profileImage) : null,
                backgroundColor: Colors.grey[300],
                child: profileImage == null ? const Icon(Icons.notifications, color: Colors.white) : null,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: iconColor,
                  child: Icon(icon, size: 14, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      TextSpan(text: name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: " "),
                      TextSpan(text: content),
                    ],
                  ),
                ),
                Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
