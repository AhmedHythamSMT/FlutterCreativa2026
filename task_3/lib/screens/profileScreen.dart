import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Image
                      Center(
                        child: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Change Profile Picture',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(),
                      SizedBox(height: 20),
                      // Profile Content
                      _headerInfo("Profile Information"),
                      SizedBox(height: 20),
                      _buildInfoRow('Name', 'Taimoor Sikander'),
                      _buildInfoRow('Username', 'taimoor_sikander'),
                      Divider(),
                      SizedBox(height: 10),
                      _headerInfo("Profile Information"),
                      SizedBox(height: 10),
                      _buildInfoRow(
                        'User ID',
                        '45689',
                        trailing: IconButton(
                          icon: Icon(Icons.copy, color: Colors.grey),
                          onPressed: () {
                            // Implement copy logic here
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Copied to clipboard')),
                            );
                          },
                        ),
                      ),
                      _buildInfoRow('E-mail', 'example@email.com'),
                      _buildInfoRow('Phone Number', '+123456789'),
                      _buildInfoRow('Gender', 'Male'),
                      _buildInfoRow('Date of Birth', '10 Oct, 1994'),
                      SizedBox(height: 20),
                      Divider(),
                      SizedBox(height: 20),
                      Center(
                        child: _buildButton('Close Account', Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {Widget? trailing}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(
          width: 100,
          child: Text(
            '$title',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(value, style: TextStyle(fontWeight: FontWeight.w900)),
        ),
        trailing ??
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, size: 14),
              color: Colors.grey,
              onPressed: () {},
            ),
      ],
    );
  }

  Widget _buildButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      child: Text(text, style: TextStyle(color: Colors.red)),
    );
  }

  Widget _headerInfo(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 15,
        color: Colors.black,
      ),
    );
  }
}
