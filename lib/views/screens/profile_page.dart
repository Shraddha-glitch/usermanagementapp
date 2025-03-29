import 'package:flutter/material.dart';
import 'package:usermanagementapp/models/model.dart';

class ProfilePage extends StatefulWidget {
  final UsersList usersList;
  const ProfilePage({super.key, required this.usersList});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void showFullImage() {
    showDialog(
      context: context,
      builder:
          (_) => CircleAvatar(
            backgroundColor: Colors.transparent,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(widget.usersList.avatar),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.usersList.first_name}'s profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Circle Photo with tap
            GestureDetector(
              onTap: showFullImage,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(widget.usersList.avatar),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              '${widget.usersList.first_name} ${widget.usersList.last_name}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Hi, it\'s me George Bluth, a passionate developer from California. '
                'I specialize in mobile development and love building apps that make life easier. '
                'When I\'m not coding, you can find me exploring new places, enjoying good food, '
                'or spending time with family and friends.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 16),

            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Contact Me via Email: ${widget.usersList.email}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
