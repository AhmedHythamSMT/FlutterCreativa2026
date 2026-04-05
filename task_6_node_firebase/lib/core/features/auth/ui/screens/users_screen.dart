import 'package:flutter/material.dart';
import 'package:task_6_node_firebase/firebase/firebase_firestore.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: FirebaseFirestoreServices.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final users = snapshot.data ?? [];

          if (users.isEmpty) {
            return const Center(child: Text("No users found"));
          }
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: user['photoURL'] != null
                      ? NetworkImage(user['photoURL'])
                      : null,
                  child: user['photoURL'] == null
                      ? const Icon(Icons.person)
                      : null,
                ),
                title: Text(
                  user['username'] ?? user['displayName'] ?? "Anonymous",
                ),
                subtitle: Text(user['email'] ?? "No Email"),
              );
            },
          );
        },
      ),
    );
  }
}
