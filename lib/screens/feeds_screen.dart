import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopTabs(),
          const Divider(height: 1),
          // We can reuse a similar structure to the home feed or create new static items
          _buildFeedItem(
              name: "Tech Insider",
              time: "2h",
              content: "The future of AI is here! 🤖 #Tech #AI",
              image: "https://picsum.photos/400/300?random=101",
              likes: "1.2K",
              comments: "234"
          ),
           _buildFeedItem(
              name: "Travel Weekly",
              time: "4h",
              content: "Top 10 destinations for 2026. Which one is on your bucket list? ✈️🌍",
              image: "https://picsum.photos/400/300?random=102",
              likes: "856",
              comments: "120"
          ),
           _buildFeedItem(
              name: "Foodie Paradise",
              time: "6h",
              content: "Best burger in town! 🍔🤤",
              image: "https://picsum.photos/400/300?random=103",
              likes: "2.5K",
              comments: "542"
          ),
          _buildFeedItem(
              name: "Gaming Hub",
              time: "8h",
              content: "New console release date announced! 🎮",
              image: null,
              likes: "5.4K",
              comments: "980"
          ),
        ],
      ),
    );
  }

  Widget _buildTopTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          const Text(
            "Feeds",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 28)),
        ],
      ),
    );
  }

  Widget _buildFeedItem({
    required String name,
    required String time,
    required String content,
    String? image,
    required String likes,
    required String comments,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Text(name[0], style: const TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          const SizedBox(width: 5),
                          Icon(Icons.public, size: 12, color: Colors.grey[600]),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(content, style: const TextStyle(fontSize: 16)),
          ),
          if (image != null)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.thumb_up, size: 10, color: Colors.white),
                ),
                const SizedBox(width: 4),
                Text(likes, style: TextStyle(color: Colors.grey[600])),
                const Spacer(),
                Text("$comments comments", style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.thumb_up_outlined, "Like"),
                _buildActionButton(Icons.comment_outlined, "Comment"),
                _buildActionButton(Icons.share_outlined, "Share"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.grey[600]),
      label: Text(label, style: TextStyle(color: Colors.grey[600])),
    );
  }
}
