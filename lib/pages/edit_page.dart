import 'package:flutter/material.dart';
import '../models/borrow_model.dart';

class EditPage extends StatefulWidget {
  final BorrowModel data;

  const EditPage({super.key, required this.data});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController namaController;
  late TextEditingController judulController;
  late TextEditingController tglPinjamController;
  late TextEditingController tglKembaliController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.data.namaPeminjam);
    judulController = TextEditingController(text: widget.data.judulBuku);
    tglPinjamController = TextEditingController(text: widget.data.tanggalPinjam);
    tglKembaliController = TextEditingController(text: widget.data.tanggalKembali);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: "Nama Peminjam"),
            ),
            TextField(
              controller: judulController,
              decoration: const InputDecoration(labelText: "Judul Buku"),
            ),
            TextField(
              controller: tglPinjamController,
              decoration: const InputDecoration(labelText: "Tanggal Pinjam"),
            ),
            TextField(
              controller: tglKembaliController,
              decoration: const InputDecoration(labelText: "Tanggal Kembali"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedData = BorrowModel(
                  namaPeminjam: namaController.text,
                  judulBuku: judulController.text,
                  tanggalPinjam: tglPinjamController.text,
                  tanggalKembali: tglKembaliController.text,
                );

                Navigator.pop(context, updatedData);
              },
              child: const Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}