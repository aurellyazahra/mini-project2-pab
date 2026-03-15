import 'package:flutter/material.dart';
import '../models/book_model.dart';

class AddBookPage extends StatefulWidget {

  final BookModel? book;

  const AddBookPage({super.key, this.book});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {

  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.book != null) {
      titleController.text = widget.book!.title;
      authorController.text = widget.book!.author;
      descriptionController.text = widget.book!.description;
      imageController.text = widget.book!.imageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {

    final isEdit = widget.book != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Buku" : "Tambah Buku"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Judul Buku",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Judul tidak boleh kosong" : null,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: authorController,
                decoration: const InputDecoration(
                  labelText: "Penulis",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Penulis tidak boleh kosong" : null,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: imageController,
                decoration: const InputDecoration(
                  labelText: "Link Gambar Buku",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(

                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                      final book = BookModel(
                        id: widget.book?.id,
                        title: titleController.text,
                        author: authorController.text,
                        description: descriptionController.text,
                        imageUrl: imageController.text,
                        isAvailable: widget.book?.isAvailable ?? true,
                      );

                      Navigator.pop(context, book);
                    }

                  },

                  child: Text(isEdit ? "Update Buku" : "Simpan Buku"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}