import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
        backgroundColor: Colors.teal, // Ubah warna AppBar
      ),
      body: SingleChildScrollView( // Membuat halaman bisa di-scroll
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card( // Menggunakan Card untuk membungkus form
                elevation: 4, // Efek bayangan untuk Card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _textboxNama(),
                      const SizedBox(height: 10),
                      _textboxNIM(),
                      const SizedBox(height: 10),
                      _textboxTahun(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama",
        prefixIcon: const Icon(Icons.person), // Ikon di TextField
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      controller: _namaController,
    );
  }

  _textboxNIM() {
    return TextField(
      decoration: InputDecoration(
        labelText: "NIM",
        prefixIcon: const Icon(Icons.badge), // Ikon di TextField
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      controller: _nimController,
    );
  }

  _textboxTahun() {
    return TextField(
      keyboardType: TextInputType.number, // Untuk input angka
      decoration: InputDecoration(
        labelText: "Tahun Lahir",
        prefixIcon: const Icon(Icons.calendar_today), // Ikon di TextField
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      controller: _tahunController,
    );
  }

  _tombolSimpan() {
    return SizedBox(
      width: double.infinity, // Tombol mengambil lebar penuh
      height: 50, // Ketinggian tombol
      child: ElevatedButton(
        onPressed: () {
          String nama = _namaController.text;
          String nim = _nimController.text;
          int tahun = int.parse(_tahunController.text);

          // Menampilkan SnackBar saat data disimpan
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Data $nama berhasil disimpan!'),
              backgroundColor: Colors.teal,
            ),
          );

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  TampilData(nama: nama, nim: nim, tahun: tahun)));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal, // Warna tombol
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Tombol dengan border melingkar
          ),
        ),
        child: const Text(
          'Simpan',
          style: TextStyle(fontSize: 18), // Ukuran teks lebih besar
        ),
      ),
    );
  }
}
