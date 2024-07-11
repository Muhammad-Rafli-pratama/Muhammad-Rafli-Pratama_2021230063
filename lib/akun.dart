import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final response = await http.get(Uri.parse('http://mobilecomputing.my.id/api_rafli/api.php'));

    if (response.statusCode == 200) {
      setState(() {
        userData = json.decode(response.body)[0];
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
        backgroundColor: Colors.green,
      ),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              userData!['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              'Informasi Pribadi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Nama Lengkap'),
              subtitle: Text(userData!['name']),
              trailing: Icon(Icons.edit),
              onTap: () {
                // Aksi ketika mengedit nama lengkap
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Password'),
              subtitle: Text('R****'),
              trailing: Icon(Icons.edit),
              onTap: () {
                // Aksi ketika mengedit email
              },
            ),
            ListTile(
              title: Text('Instagram'),
              subtitle: Text(userData!['instagram_username']),
              trailing: Icon(Icons.edit),
              onTap: () {
                // Aksi ketika mengedit username Instagram
              },
            ),
          ],
        ),
      ),
    );
  }
}
