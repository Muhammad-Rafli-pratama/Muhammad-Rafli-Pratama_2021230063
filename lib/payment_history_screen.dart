import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildPaymentItem(
            context,
            'Tomang, Jakarta Barat',
            'Rp 2.500.000 - 11 Juli 2024',
            Icons.payment,
          ),
          // Tambahkan item riwayat transaksi lainnya sesuai kebutuhan
        ],
      ),
    );
  }

  Widget _buildPaymentItem(
      BuildContext context,
      String title,
      String subtitle,
      IconData iconData,
      ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          iconData,
          color: Colors.green,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        onTap: () {
          // Tambahkan aksi saat item diklik (jika diperlukan)
        },
      ),
    );
  }
}
