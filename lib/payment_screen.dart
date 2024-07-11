import 'package:flutter/material.dart';
import 'payment_history_screen.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedBank;
  List<String> _banks = ['BCA', 'Mandiri', 'BRI', 'BNI'];
  String? _virtualAccount;
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  List<String> _months = [
    'Januari', 'Februari', 'Maret', 'April',
    'Mei', 'Juni', 'Juli', 'Agustus',
    'September', 'Oktober', 'November', 'Desember'
  ];
  List<String> _years = [
    '2022', '2023', '2024', '2025',
    '2026', '2027', '2028', '2029',
    '2030'
  ];

  void generateVirtualAccount(String bank) {
    // Simulasi pembuatan Virtual Account sesuai dengan bank
    if (bank == 'BCA') {
      _virtualAccount = '1234567890'; // Contoh Virtual Account BCA
    } else if (bank == 'Mandiri') {
      _virtualAccount = '9876543210'; // Contoh Virtual Account Mandiri
    } else if (bank == 'BRI') {
      _virtualAccount = '5678901234'; // Contoh Virtual Account BRI
    } else if (bank == 'BNI') {
      _virtualAccount = '4567890123'; // Contoh Virtual Account BNI
    } else {
      _virtualAccount = null;
    }
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metode Pembayaran'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              isExpanded: true, // Mengatur agar dropdown menyesuaikan lebar parent
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Transfer Bank',
                filled: true,
                fillColor: Colors.white,
              ),
              value: _selectedBank,
              items: _banks.map((String bank) {
                return DropdownMenuItem<String>(
                  value: bank,
                  child: Text(bank),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBank = newValue;
                  generateVirtualAccount(newValue!); // Generate VA saat bank dipilih
                });
              },
            ),
            const SizedBox(height: 20),
            if (_virtualAccount != null) ...[
              Text(
                'Kode Virtual Account',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _virtualAccount!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
            ],
            Text(
              'Detail Penyewaan Kamar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Mulai Sewa:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Container(
                    width: 120,
                    child: TextFormField(
                      controller: _startDateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Tanggal',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Container(
                    width: 120,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true, // Menyesuaikan lebar dropdown
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      value: _months[0],
                      items: _months.map((String month) {
                        return DropdownMenuItem<String>(
                          value: month,
                          child: Text(month),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          // Handle month selection
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Container(
                    width: 100,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true, // Menyesuaikan lebar dropdown
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      value: _years[0],
                      items: _years.map((String year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Text(year),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          // Handle year selection
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Biaya Sewa Kost',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Harga Sewa per Bulan:',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Rp 2.000.000',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Air & Kebersihan:',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Rp 300.000',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Benefit Asuransi & Biaya Admin:',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Rp 200.000',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Biaya Sewa Kost:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp 2.500.000',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Spacer(), // Spacer untuk mendorong tombol ke bawah
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedBank == null || _startDateController.text.isEmpty) {
                    // Tampilkan pesan kesalahan jika salah satu atau kedua field belum diisi
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Harap lengkapi metode pembayaran dan tanggal sewa.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    // Aksi untuk tombol bayar jika sudah terisi semua
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pembayaran Berhasil'),
                          content: Text('Terima kasih atas pembayarannya.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PaymentHistoryScreen()),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Konfirmasi',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20), // Menambahkan jarak di bawah tombol
          ],
        ),
      ),
    );
  }
}
