import 'package:flutter/material.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopHeader(),
          const Divider(height: 1),
          _buildVideoCard(
            publisher: "Viral Videos",
            time: "2h",
            caption: "You won't believe what happened next! 😱",
            thumbnail: "https://picsum.photos/400/250?random=301",
            views: "1.5M views",
            likes: "45K",
            comments: "2.3K",
          ),
          const SizedBox(height: 8),
          _buildVideoCard(
            publisher: "Daily Dose of Internet",
            time: "5h",
            caption: "Satisfying video compilation 😌",
             thumbnail: "https://picsum.photos/400/250?random=302",
            views: "3.2M views",
            likes: "120K",
             comments: "8.5K",
          ),
           const SizedBox(height: 8),
          _buildVideoCard(
            publisher: "Sports Highlights",
            time: "10h",
            caption: "Best goals of the week! ⚽",
             thumbnail: "https://picsum.photos/400/250?random=303",
            views: "500K views",
            likes: "15K",
             comments: "900",
          ),
        ],
      ),
    );
  }

  Widget _buildTopHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Text("Watch", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person, size: 28)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 28)),
        ],
      ),
    );
  }

  Widget _buildVideoCard({
    required String publisher,
    required String time,
    required String caption,
    required String thumbnail,
    required String views,
    required String likes,
    required String comments,
  }) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text(publisher[0], style: const TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(publisher, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  ],
                ),
                const Spacer(),
                const Text("Follow", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                const Icon(Icons.more_horiz),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(caption, style: const TextStyle(fontSize: 15)),
          ),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                thumbnail,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  child: const Icon(Icons.thumb_up, size: 10, color: Colors.white),
                ),
                const SizedBox(width: 4),
                Text(likes),
                const Spacer(),
                Text("$views • $comments comments"),
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
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined, color: Colors.grey),
                label: const Text('Share', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
