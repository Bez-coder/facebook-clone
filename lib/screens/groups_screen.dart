import 'package:flutter/material.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopBar(),
          _buildYourGroups(),
          const Divider(thickness: 8, color: Color(0xFFE4E6EB)),
          _buildPost(
            groupName: "Flutter Developers",
            userName: "John Doe",
            time: "2 mins ago",
            content: "Has anyone tried the new Flutter 3.0 features? They are amazing! 🚀",
            image: "https://picsum.photos/400/300?random=201",
            likes: "45",
            comments: "12",
          ),
          const Divider(thickness: 8, color: Color(0xFFE4E6EB)),
          _buildPost(
            groupName: "Dart Lovers",
            userName: "Jane Smith",
            time: "1 hour ago",
            content: "What's the best way to handle state management? Provider vs Riverpod? 🤔",
            image: null,
            likes: "120",
            comments: "56",
          ),
           const Divider(thickness: 8, color: Color(0xFFE4E6EB)),
          _buildPost(
            groupName: "Mobile App Design",
            userName: "Alex Designer",
            time: "3 hours ago",
            content: "Check out this new UI kit I found!",
            image: "https://picsum.photos/400/300?random=202",
            likes: "230",
            comments: "44",
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Groups",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                 child: const Icon(Icons.add, size: 24),
              ),
               Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                 child: const Icon(Icons.search, size: 24),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildYourGroups() {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        children: [
          _buildGroupItem("Flutter Devs", "https://picsum.photos/100?random=210"),
          _buildGroupItem("React Native", "https://picsum.photos/100?random=211"),
          _buildGroupItem("UI/UX Design", "https://picsum.photos/100?random=212"),
          _buildGroupItem("Startups", "https://picsum.photos/100?random=213"),
          _buildGroupItem("Memes", "https://picsum.photos/100?random=214"),
        ],
      ),
    );
  }

  Widget _buildGroupItem(String name, String image) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPost({
    required String groupName,
    required String userName,
    required String time,
    required String content,
    String? image,
    required String likes,
    required String comments,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Icon(Icons.groups, color: Colors.white)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(groupName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("$userName · $time", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(content, style: const TextStyle(fontSize: 14)),
          ),
          const SizedBox(height: 8),
          if (image != null)
             Image.network(
              image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.thumb_up, size: 16, color: Colors.blue),
                const SizedBox(width: 4),
                Text(likes),
                const Spacer(),
                Text("$comments comments"),
              ],
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up_outlined, color: Colors.grey),
                label: const Text('Like', style: TextStyle(color: Colors.grey)),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.comment_outlined, color: Colors.grey),
                label: const Text('Comment', style: TextStyle(color: Colors.grey)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
