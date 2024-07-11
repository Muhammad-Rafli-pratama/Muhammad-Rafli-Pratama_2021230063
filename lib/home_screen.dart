import 'package:flutter/material.dart';
import 'kost_selection_screen.dart';
import 'favorite_screen.dart';
import 'home_kost_screen.dart';
import 'profile_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  final List<String> favoriteItems;

  HomeScreen({Key? key, required this.favoriteItems}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  int _selectedIndex = 2; // Default to the 'Kos Saya' tab

  void addToFavorites(String item) {
    setState(() {
      widget.favoriteItems.add(item);
    });
  }

  List<Widget> _widgetOptions() {
    return <Widget>[
      KostSelectionScreen(
        searchQuery: '',
        addToFavorites: addToFavorites, // Make sure to pass addToFavorites to KostSelectionScreen
      ),
      FavoriteScreen(favoriteItems: widget.favoriteItems),
      HomeKostScreen(),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _submitComment(String comment) async {
    try {
      final response = await http.post(
        Uri.parse('http://mobilecomputing.my.id/api_rafli/komen.php'),
        body: json.encode({'comment': comment}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Komentar berhasil dikirim')),
        );
        Navigator.pushNamed(context, '/daftarkomentar');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengirim komentar')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }


  void _showCommentDialog() {
    TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Tambah Komentar'),
        content: TextField(
          controller: commentController,
          decoration: InputDecoration(hintText: 'Masukkan komentar Anda'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              String comment = commentController.text;
              _submitComment(comment);
              Navigator.of(context).pop();
            },
            child: Text('Kirim'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MRP.kost'),
        actions: [
          IconButton(
            icon: const Icon(Icons.comment),
            onPressed: _showCommentDialog,
          ),
        ],
      ),
      body: _widgetOptions().elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Kos Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Masuk',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
