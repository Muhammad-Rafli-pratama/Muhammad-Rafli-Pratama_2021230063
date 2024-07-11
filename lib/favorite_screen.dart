import 'package:flutter/material.dart';
import 'kost_detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  final List<String> favoriteItems; // Tambahkan parameter untuk daftar favorit

  const FavoriteScreen({Key? key, required this.favoriteItems}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> _favoriteItems = []; // State untuk daftar favorit

  @override
  void initState() {
    super.initState();
    _favoriteItems = widget.favoriteItems; // Inisialisasi daftar favorit dari widget
  }

  void _removeFavorite(int index) {
    setState(() {
      _favoriteItems.removeAt(index); // Hapus item dari daftar favorit
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorit'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f7fa), Color(0xFF80cbc4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _favoriteItems.isEmpty
              ? Center(
            child: Text(
              'Belum ada favorit.',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black54,
              ),
            ),
          )
              : ListView.builder(
            itemCount: _favoriteItems.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 40,
                  ),
                  title: Text(
                    _favoriteItems[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _removeFavorite(index); // Panggil fungsi hapus
                        },
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.black54),
                    ],
                  ),
                  onTap: () {
                    // Navigasi ke KostDetailScreen dengan parameter judul kost
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KostDetailScreen(
                          title: _favoriteItems[index],
                          price: 'Rp.2.000.000', // Ganti dengan harga yang sesuai jika ada
                          description: 'Campur', // Ganti dengan deskripsi yang sesuai jika ada
                          imagePath: 'assets/images/rmh.kost1.jpg', // Ganti dengan gambar yang sesuai jika ada
                          addToFavorites: (title) {}, // Tambahkan jika perlu
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
