import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../services/book_service.dart';
import '../services/auth_service.dart';
import 'detail_page.dart';
import 'add_book_page.dart';
import 'login_page.dart';
import '../main.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget buildBookImage(String url) {
  if (url.startsWith("http")) {
    return Image.network(
      url,
      height: 90,
      width: 65,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) =>
          const Icon(Icons.broken_image, size: 40),
    );
  } else {
    return Image.asset(
      url,
      height: 90,
      width: 65,
      fit: BoxFit.contain,
    );
  }
}

class _HomePageState extends State<HomePage> {
  final BookService bookService = BookService();
  final AuthService authService = AuthService();
  List<BookModel> books = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  Future<void> loadBooks() async {
    setState(() => isLoading = true);
    final data = await bookService.getBooks();
    setState(() {
      books = data;
      isLoading = false;
    });
  }

  Future<void> updateBook(BookModel book) async {
    await bookService.updateBook(book);
    await loadBooks();
  }

  Future<void> deleteBook(String id) async {
    await bookService.deleteBook(id);
    await loadBooks();
  }

  Future<void> openAddBook() async {
    final newBook = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddBookPage(),
      ),
    );

    if (newBook != null) {
      await bookService.addBook(newBook);
      await loadBooks();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Buku berhasil ditambahkan")),
      );
    }
  }

  Future<void> confirmLogout() async {
  final confirm = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Apakah kamu yakin ingin logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text("Batal"),
          ),

          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text("Logout"),
          ),
        ],
      );
    },
  );

  if (confirm == true) {

    await authService.logout();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }
}


  Future<void> logout() async {

    await authService.logout();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/image.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 60, left: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Colors.black.withOpacity(0.45),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.person, color: Colors.white, size: 30),
            SizedBox(height: 15),

            Text(
              "Selamat Datang di",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            SizedBox(height: 6),

            Text(
              "Perpustakaan Digital",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 6),

            Text(
              "Temukan buku favoritmu hari ini",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBookCard(BookModel book) {
    return GestureDetector(
      onTap: () async {

        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(book: book),
          ),
        );

        if (result is BookModel) {
          await updateBook(result);
        }

        if (result == "borrow") {
          book.isAvailable = false;
          updateBook(book);
        }

        if (result == "return") {
          book.isAvailable = true;
          updateBook(book);
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.delete, size: 16),
                onPressed: () => deleteBook(book.id!),
              ),
            ),

            buildBookImage(book.imageUrl),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [

                  Text(
                    book.title,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 2),

                  Text(
                    book.author,
                    style: const TextStyle(
                      fontSize: 9,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                color: book.isAvailable
                    ? Colors.green
                    : Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                book.isAvailable
                    ? "Tersedia"
                    : "Tidak Tersedia",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildGrid() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: books.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return buildBookCard(books[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        toolbarHeight: 30,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            MyApp.isDark(context)
                ? Icons.light_mode
                : Icons.dark_mode,
            size: 18,
          ),
          onPressed: () {
            MyApp.toggleTheme(context);
          },
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.logout, size: 18),
            onPressed: confirmLogout,
          )
        ],

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Beranda", style: TextStyle(fontSize: 10)),
            SizedBox(width: 50),
            Text("Buku", style: TextStyle(fontSize: 10)),
            SizedBox(width: 50),
            Text("Profil", style: TextStyle(fontSize: 10)),
          ],
        ),
      ),

      body: Column(
        children: [
          buildHeader(),
          const SizedBox(height: 15),
          Expanded(child: buildGrid()),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: openAddBook,
        child: const Icon(Icons.add),
      ),
    );
  }
}