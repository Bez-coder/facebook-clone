import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:facebook_clone/services/auth_service.dart';
import 'login_screen.dart';
import 'watch_screen.dart';
import 'friends_screen.dart';
import 'marketplace_screen.dart';
import 'notifications_screen.dart';
import 'menu_screen.dart';
import 'messenger_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'facebook',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1877F2),
              letterSpacing: -1,
            ),
          ),
          actions: [
            _buildCircleButton(Icons.add, () {}),
            _buildCircleButton(Icons.search, () {}),
            _buildCircleButton(Icons.message, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MessengerScreen()),
              );
            }),
            const SizedBox(width: 10),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFF1877F2),
            labelColor: Color(0xFF1877F2),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.home, size: 28)),
              Tab(icon: Icon(Icons.ondemand_video, size: 28)),
              Tab(icon: Icon(Icons.people, size: 28)),
              Tab(icon: Icon(Icons.storefront, size: 28)),
              Tab(icon: Icon(Icons.notifications, size: 28)),
              Tab(icon: Icon(Icons.menu, size: 28)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _HomePageContent(),
            const WatchScreen(),
            const FriendsScreen(),
            const MarketplaceScreen(),
            const NotificationsScreen(),
             MenuScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 22),
        onPressed: onPressed,
      ),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // "What's on your mind?" Card
          _buildCreatePostCard(),
          const Divider(height: 8, thickness: 8, color: Color(0xFFCFD0D1)), // Thicker divider
          // Stories Section
          _buildStoriesSection(),
          const Divider(height: 8, thickness: 8, color: Color(0xFFCFD0D1)),
          // Recent Posts Section
          _buildRecentPosts(),
        ],
      ),
    );
  }

  Widget _buildCreatePostCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      color: Colors.white,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text('What\'s on your mind?'),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.photo_library, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildStoriesSection() {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildMusicStoryCard(),
          const SizedBox(width: 6),
          _buildCreateStoryCard(),
          const SizedBox(width: 6),
          // User Stories would go here
        ],
      ),
    );
  }

  Widget _buildMusicStoryCard() {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF26A69A), Color(0xFF4DB6AC)], // Teal gradient like screenshot
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.music_note, color: Colors.black),
          ),
          SizedBox(height: 50), // Push text to bottom
          Text(
            "Music",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

    Widget _buildCreateStoryCard() {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey, // Placeholder for user image background or just grey
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  ),
                   child: const Center(
                    child: Icon(Icons.person, size: 50, color: Colors.white,),
                   ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                     color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    "Create story",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 24),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildRecentPosts() {
    return Column(
      children: [
        _buildPostItem(
          "Akaki Kality Council office",
          "3d",
          "It has been stated that the trees planted in the winter should be taken care of...",
          [
            "https://picsum.photos/300/300?random=881",
            "https://picsum.photos/300/300?random=882",
            "https://picsum.photos/300/300?random=883",
            "https://picsum.photos/300/300?random=884",
          ],
          likes: "125",
          comments: "45 shares",
        ),
        const Divider(thickness: 8, color: Color(0xFFCFD0D1)),
        _buildPostItem(
          "Travel Days",
          "5h",
          "Missing these summer vibes! ☀️🌴 Who else is ready for a vacation?",
          [
            "https://picsum.photos/400/300?random=901",
          ],
          likes: "1.2K",
           comments: "203 comments",
        ),
        const Divider(thickness: 8, color: Color(0xFFCFD0D1)),
         _buildPostItem(
          "Tech Crunch",
          "1d",
          "The new gadget everyone is talking about. Review coming soon.",
          [
            "https://picsum.photos/300/300?random=902",
            "https://picsum.photos/300/300?random=903",
          ],
           likes: "504",
           comments: "89 comments",
        ),
      ],
    );
  }

  Widget _buildPostItem(String name, String time, String content, List<String> images, {String likes = "0", String comments = "0 comments"}) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blueAccent, // Logo placeholder
                   child: Icon(Icons.business, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Row(
                        children: [
                          Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          const SizedBox(width: 4),
                          const Icon(Icons.public, size: 12, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz),
                const SizedBox(width: 10),
                 const Icon(Icons.close),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(content, style: const TextStyle(fontSize: 15)),
                 const SizedBox(height: 4),
                 if (content.length > 50)
                  const Text("See more", style: TextStyle(color: Colors.grey)),
                 const SizedBox(height: 8),
                 if (name.contains("Council")) // Only show translation for that specific post
                   const Row(
                     children: [
                       Icon(Icons.settings, size: 14, color: Colors.grey,),
                        SizedBox(width: 4),
                       Text("Rate this translation", style: TextStyle(fontSize: 12, color: Colors.grey))
                     ],
                   )
               ],
            ),
          ),
          const SizedBox(height: 8),
          // Grid for images
          if (images.length == 1)
            Image.network(images[0], fit: BoxFit.cover, height: 250, width: double.infinity)
          else 
            SizedBox(
              height: 350,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: images.map((img) => Image.network(img, fit: BoxFit.cover)).toList(),
              ),
            ),
           // Interaction Stats
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
             child: Row(
               children: [
                 Container(
                   padding: const EdgeInsets.all(4),
                   decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                   child: const Icon(Icons.thumb_up, size: 10, color: Colors.white),
                 ),
                 const SizedBox(width: 4),
                 Text(likes, style: TextStyle(color: Colors.grey[600])),
                 const Spacer(),
                 Text(comments, style: TextStyle(color: Colors.grey[600])),
               ],
             ),
           ),
           const Divider(height: 1),
           // Action Buttons
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               _buildActionButton(Icons.thumb_up_outlined, "Like"),
               _buildActionButton(Icons.comment_outlined, "Comment"),
               _buildActionButton(Icons.share_outlined, "Share"),
             ],
           ),
           const SizedBox(height: 8),
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
