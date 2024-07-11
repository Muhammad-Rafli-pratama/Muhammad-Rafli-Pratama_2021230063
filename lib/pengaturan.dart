import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _notificationPreference = 'none';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildRadioTile(
              title: 'Notifikasi Rekomendasi via Email',
              value: 'email',
              groupValue: _notificationPreference,
              onChanged: (String? value) {
                setState(() {
                  _notificationPreference = value!;
                });
              },
            ),
            Divider(),
            _buildRadioTile(
              title: 'Notifikasi via Chat',
              value: 'chat',
              groupValue: _notificationPreference,
              onChanged: (String? value) {
                setState(() {
                  _notificationPreference = value!;
                });
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: const Text('Hapus Akun', style: TextStyle(color: Colors.red)),
              onTap: () {
                _showDeleteAccountDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioTile({
    required String title,
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return RadioListTile<String>(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: Colors.green,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Akun'),
          content: const Text('Apakah Anda yakin ingin menghapus akun Anda? Tindakan ini tidak bisa dibatalkan.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Hapus', style: TextStyle(color: Colors.red)),
              onPressed: () {
                // Aksi ketika menghapus akun
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
