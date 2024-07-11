import 'package:flutter/material.dart';
import 'kost_detail_screen.dart';

class KostSelectionScreen extends StatelessWidget {
  final String searchQuery;
  final Function(String) addToFavorites; // Add declaration for addToFavorites parameter

  const KostSelectionScreen({
    Key? key,
    required this.searchQuery,
    required this.addToFavorites, // Add addToFavorites parameter here
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Rumah Kost'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          buildKostCard(
            context,
            'Tomang, Jakarta Barat',
            'Rp 2.000.000/bulan',
            'Campur',
            'assets/images/rmh.kost1.jpg',
          ),
          buildKostCard(
            context,
            'Kebon Jeruk, Jakarta Barat',
            'Rp 1.500.000/bulan',
            'Khusus Cewe',
            'assets/images/rmh.kost2.jpg',
          ),
          buildKostCard(
            context,
            'Duren Sawit, Jakarta Timur',
            'Rp 2.000.000/bulan',
            'Campur',
            'assets/images/rmh.kost3.jpg',
          ),
          buildKostCard(
            context,
            'Kalibata, Jakarta Selatan',
            'Rp 2.500.000/bulan',
            'Khusus Cowo',
            'assets/images/rmh.kost4.jpg',
          ),
          buildKostCard(
            context,
            'Cikini, Jakarta Pusat',
            'Rp 2.300.000/bulan',
            'Campur',
            'assets/images/rmh.kost5.jpg',
          ),
        ],
      ),
    );
  }

  Widget buildKostCard(BuildContext context, String title, String price, String description, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KostDetailScreen(
                  title: title,
                  price: price,
                  description: description,
                  imagePath: imagePath,
                  addToFavorites: addToFavorites, // Make sure to pass addToFavorites to KostDetailScreen
                ),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
