import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'home_screen.dart';
import 'welcome_screen.dart';
import 'kost_selection_screen.dart';
import 'kost_detail_screen.dart';
import 'favorite_screen.dart';
import 'payment_screen.dart';
import 'daftarkomentar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final Map<String, String> _users = {};
  List<String> favoriteItems = []; // Global state for favorite items

  void _addUser(String username, String password) {
    setState(() {
      _users[username] = password;
    });
  }

  void addToFavorites(String item) {
    setState(() {
      favoriteItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Login Register',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/kost-selection') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) {
              return KostSelectionScreen(
                searchQuery: args['searchQuery']!,
                addToFavorites: addToFavorites,
              );
            },
          );
        }
        // Handle other named routes
        return null;
      },
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => RegisterScreen(addUser: _addUser),
        '/home': (context) => HomeScreen(favoriteItems: favoriteItems),
        '/kost-detail': (context) => KostDetailScreen(
          title: 'Nama Kost',
          price: 'Harga Kost',
          description: 'Deskripsi Kost',
          imagePath: 'assets/images/kost_image.png',
          addToFavorites: addToFavorites,
        ),
        '/favorite': (context) => FavoriteScreen(favoriteItems: favoriteItems),
        '/payment': (context) => PaymentScreen(), // Pastikan PaymentScreen telah diimpor
        '/daftarkomentar': (context) => DaftarKomentarScreen(), // Tambahkan ini
      },
    );
  }
}
