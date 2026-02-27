import 'package:flutter/material.dart';
import '../models/borrow_model.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final namaController = TextEditingController();
  final judulController = TextEditingController();
  final tglPinjamController = TextEditingController();
  final tglKembaliController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama Peminjam",
              ),
            ),
            TextField(
              controller: tglPinjamController,
              decoration: const InputDecoration(
                labelText: "Tanggal Pinjam",
              ),
            ),
            TextField(
              controller: tglKembaliController,
              decoration: const InputDecoration(
                labelText: "Tanggal Kembali",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newData = BorrowModel(
                  namaPeminjam: namaController.text,
                  judulBuku: judulController.text,
                  tanggalPinjam: tglPinjamController.text,
                  tanggalKembali: tglKembaliController.text,
                );

                Navigator.pop(context, newData);
              },
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}