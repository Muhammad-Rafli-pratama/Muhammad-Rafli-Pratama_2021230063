import 'package:flutter/material.dart';
import 'payment_history_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigasi ke NotificationScreen saat icon notifikasi di-tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Pembayaran Berhasil'),
            subtitle: Text('Pembayaran untuk kos di Jl. Sudirman telah berhasil.'),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Pembayaran Gagal'),
            subtitle: Text('Pembayaran untuk kos di Jl. Thamrin gagal. Silakan coba lagi.'),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Metode Pembayaran Baru'),
            subtitle: Text('Metode pembayaran via OVO telah ditambahkan.'),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Riwayat Transaksi'),
            subtitle: Text('Lihat riwayat transaksi Anda di sini.'),
            onTap: () {
              // Navigasi ke PaymentHistoryScreen saat item ini di-tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentHistoryScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
