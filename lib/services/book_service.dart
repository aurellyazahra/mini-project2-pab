import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/book_model.dart';

class BookService {
  final supabase = Supabase.instance.client;
  Future<List<BookModel>> getBooks() async {
    try {
      final response = await supabase.from('books').select();
      return (response as List)
          .map((e) => BookModel.fromMap(e))
          .toList();
    } catch (e) {
      print("ERROR GET BOOKS: $e");
      return [];
    }
  }

  Future<void> addBook(BookModel book) async {
    try {
      await supabase.from('books').insert(book.toMap());
      ("Buku berhasil ditambahkan");
    } catch (e) {
      ("ERROR INSERT: $e");
    }
  }

  Future<void> updateBook(BookModel book) async {
    await supabase
        .from('books')
        .update(book.toMap())
        .eq('id', book.id!);
  }

  Future<void> deleteBook(String id) async {
    await supabase
        .from('books')
        .delete()
        .eq('id', id);
  }
}