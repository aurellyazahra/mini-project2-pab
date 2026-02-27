import 'package:flutter/material.dart';
import '../models/book_model.dart';
import 'add_page.dart';
import 'add_book_page.dart';

class DetailPage extends StatelessWidget {
  final BookModel book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Buku"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              book.imageUrl.startsWith("http")
                  ? Image.network(
                      book.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image, size: 100);
                      },
                    )
                  : Image.asset(
                      book.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Penulis: ${book.author}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Deskripsi:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(book.description),
                  const SizedBox(height: 30),
                  

                  /// Tombol Pinjam / Kembalikan
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (book.isAvailable) {
                          // Jika buku tersedia → Pinjam
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AddPage(),
                            ),
                          );
                          if (result != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Buku berhasil dipinjam!"),
                              ),
                            );
                            Navigator.pop(context, "borrow");
                          }
                        } else {
                          // Jika buku sedang dipinjam → Kembalikan
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Buku berhasil dikembalikan!"),
                            ),
                          );
                          Navigator.pop(context, "return");
                        }
                      },
                      child: Text(
                        book.isAvailable
                            ? "Pinjam Buku"
                            : "Kembalikan Buku",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final updatedBook = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddBookPage(book: book),
                          ),
                        );
                        if (updatedBook != null) {
                          Navigator.pop(context, updatedBook);
                        }
                      },
                      child: const Text(
                        "Edit Buku",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}