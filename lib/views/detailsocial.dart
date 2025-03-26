import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Post", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header
            _buildPostHeader(),

            const SizedBox(height: 15),

            // Post Title & Content
            const Text("We Clean", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 5),
            const Text(
              "Did you know that despite Bangladesh's National Social Security Strategy...",
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),

            const SizedBox(height: 10),

            // Post Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/icons/panda1.jpg', fit: BoxFit.cover),
            ),

            const SizedBox(height: 15),

            // Like, Comment, Share Buttons
            _buildPostActions(),

            const Divider(height: 30),

            // Comment Input Box
            _buildCommentInput(),

            const SizedBox(height: 15),

            // Comments Section
            const Text("Comments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // List of Comments
            _buildComment("Er", "We should protect our environment", "4w", true),
            _buildComment("John", "Great initiative!", "1w", true),
            _buildComment("Alice", "I support this movement!", "3d", false),
          ],
        ),
      ),
    );
  }

  // Post Header with User Info
  Widget _buildPostHeader() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/icons/panda.jpg'),
          radius: 25,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Er", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text("13 March 2025", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.grey.shade600),
          onPressed: () {}, // TODO: Add options like Report, Save Post
        ),
      ],
    );
  }

  // Post Actions (Like, Comment, Share)
  Widget _buildPostActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconText(Icons.favorite, "30k", Colors.green),
        _buildIconText(Icons.comment, "Comment", Colors.green),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.green),
          onPressed: () {}, // TODO: Implement share functionality
        ),
      ],
    );
  }

  // Comment Input Field
  Widget _buildCommentInput() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/icons/panda.jpg'),
          radius: 22,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Write a comment...",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.send, color: Colors.green),
          onPressed: () {}, // TODO: Implement send comment
        ),
      ],
    );
  }

  // Post Actions Widget (Like, Comment, Share)
  Widget _buildIconText(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  // Comment with Like & Reply
  Widget _buildComment(String user, String comment, String time, bool hasReplies) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/icons/panda.jpg'),
                radius: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(comment, style: const TextStyle(color: Colors.black87, fontSize: 14)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          const SizedBox(width: 15),
                          _buildSmallIconText(Icons.thumb_up_alt_outlined, "Like"),
                          const SizedBox(width: 15),
                          _buildSmallIconText(Icons.reply, "Reply"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Replies Section
          if (hasReplies)
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 8),
              child: Column(
                children: [
                  _buildReply("David", "I agree!", "2d"),
                  _buildReply("Sophia", "Great point!", "1d"),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Reply Widget
  Widget _buildReply(String user, String reply, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/icons/panda.jpg'),
            radius: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(reply, style: const TextStyle(color: Colors.black87, fontSize: 13)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(width: 10),
                      _buildSmallIconText(Icons.thumb_up_alt_outlined, "Like"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Small Icon Text for Like & Reply
  Widget _buildSmallIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade600, size: 16),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      ],
    );
  }
}
