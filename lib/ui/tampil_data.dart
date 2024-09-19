import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int umur = DateTime.now().year - tahun;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Diri"),
        backgroundColor: Colors.teal, // Ubah warna AppBar sesuai tema
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 5, // Efek bayangan
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Sudut membulat
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildIcon(),
                  const SizedBox(height: 20),
                  _buildText("Nama:", nama),
                  _buildText("NIM:", nim),
                  _buildText("Umur:", "$umur tahun"),
                  const SizedBox(height: 20),
                  _buildBackButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan ikon
  Widget _buildIcon() {
    return Icon(
      Icons.person, // Icon pengguna
      size: 80,
      color: Colors.teal,
    );
  }

  // Widget untuk menampilkan teks dengan label dan data
  Widget _buildText(String label, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold, // Membuat label bold
              fontSize: 18,
              color: Colors.black54, // Warna label lebih halus
            ),
          ),
          Text(
            data,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk tombol kembali ke halaman sebelumnya
  Widget _buildBackButton(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Tombol memenuhi lebar
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context); // Kembali ke halaman sebelumnya
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal, // Warna tombol
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Membuat tombol melingkar
          ),
        ),
        child: const Text(
          "Kembali",
          style: TextStyle(
            fontSize: 16, // Ukuran teks lebih besar
          ),
        ),
      ),
    );
  }
}
