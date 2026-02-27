import 'package:flutter/material.dart';
import '../models/book_model.dart';
import 'detail_page.dart';
import 'add_book_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget buildBookImage(String imageUrl,
    {double? height, double? width, BoxFit fit = BoxFit.cover}) {
  if (imageUrl.startsWith("http")) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.broken_image, size: 50);
      },
    );
  } else {
    return Image.asset(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
    );
  }
}

class _HomePageState extends State<HomePage> {
  List<BookModel> books = [
    BookModel(
      title: "Mantappu Jiwa",
      author: "Jerome Polin Sijabat",
      description:
          "Kehidupan pribadinya selama di Jepang dan cara belajar Bahasa Jepang.",
      imageUrl: "assets/images/mantappu.png",
      isAvailable: true,
    ),
    BookModel(
      title: "The Star and I",
      author: "Ilana Tana",
      description:
          "Kamu, kulihat dunia dalam matamu dan masa depan dalam senyummu...",
      imageUrl: "assets/images/thestar.png",
      isAvailable: false,
    ),
    BookModel(
      title: "Sebuah Seni Untuk Bersikap Bodo Amat",
      author: "Mark Manson",
      description:
          "Cocok untuk kamu yang sedang mencari makna dalam hidup maupun yang sedang berada pada titik terendah dalam hidup.",
      imageUrl: "assets/images/sebuahseni.png",
      isAvailable: true,
    ),
    BookModel(
      title: "Nanti Kita Bercerita Tentang Hari Ini",
      author: "Marchella FP",
      description:
          "Buku ini bukan hanya membuat kita mengenal diri sendiri tetapi juga mengajak kita untuk mengenal orang lain.",
      imageUrl: "assets/images/nantikita.png",
      isAvailable: true,
    ),
    BookModel(
      title: "Luka Kata",
      author: "Canda Malik",
      description:
          "Kumpulan puisi Luka Kata ini menjadi bukti, loyalitas penyair yang Abadi. Dimana puisi adalah laboratorium umat manusia dalam mengolah, memakai dan memahami bahasa.",
      imageUrl: "assets/images/lukata.png",
      isAvailable: true,
    ),
    BookModel(
      title: "Murder on the Orient Express",
      author: "Agatha Christie",
      description:
          "Buku ini menawarkan kisah yang menarik karena semua orang di dalam gerbong dengan korban memiliki alibi dalam pembunuhan ini. Sang penulis membuat kita merasakan seperti berada dalam kereta Orient Express dan membuat kita berpikir kritis mengenai siapa pembunuh yang sebenarnya.",
      imageUrl: "assets/images/murder.png",
      isAvailable: true,
    ),
  ];
  

  void updateBookStatus(int index) {
    setState(() {
      books[index].isAvailable = false;
    });
  }

  void updateBook(int index, BookModel updatedBook) {
    setState(() {
      books[index] = updatedBook;
    });
  }
  
@override
Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Beranda", style: TextStyle(fontSize: 10, color: Colors.black)),
            SizedBox(width: 50),
            Text("Buku", style: TextStyle(fontSize: 10, color: Colors.black)),
            SizedBox(width: 50),
            Text("Profil", style: TextStyle(fontSize: 10, color: Colors.black)),
          ],
        ),
      ),

      body: Column(
        children: [
        

        // ===== HEADER CUSTOM =====
        Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            image: const DecorationImage(
              image: AssetImage("assets/images/image.png"), 
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Colors.black.withOpacity(0.45), // overlay gelap
            ),
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // ===== ICON DI ATAS =====
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 28,
                ),
              ),

              const SizedBox(height: 15),

              // ===== TEXT =====
              const Text(
                "Selamat Datang di",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
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
        ),

        const SizedBox(height: 15),

        // ===== GRID BUKU =====
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              itemCount: books.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final book = books[index];

                return GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(book: books[index]),
                    ),
                  );
                  if (result is BookModel) {
                    updateBook(index, result);
                  }

                  if (result == "borrow") {
                    setState(() {
                      books[index].isAvailable = false;
                    });
                  }

                  if (result == "return") {
                    setState(() {
                      books[index].isAvailable = true;
                    });
                  }

                    if (result == true) {
                      updateBookStatus(index);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        
                        // ===== DELETE ICON (SIMPLE) =====
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.delete, size: 16, color: Color.fromARGB(255, 168, 168, 168)),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            setState(() {
                              books.removeAt(index);
                            });
                          },
                        ),
                      ),

                        const SizedBox(height: 6),
                        buildBookImage(
                          book.imageUrl,
                          height: 90,
                          width: 65,
                          fit: BoxFit.contain,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(
                                  horizontal: 6),
                          child: Column(
                            children: [
                              Text(
                                book.title,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow:
                                    TextOverflow.ellipsis,
                                textAlign:
                                    TextAlign.center,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                book.author,
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow:
                                    TextOverflow.ellipsis,
                                textAlign:
                                    TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        
                        Padding(
                          padding:
                              const EdgeInsets.only(
                                  bottom: 6),
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 6,
                            ),
                            decoration: BoxDecoration(
                              color: book.isAvailable
                                  ? Colors.green
                                  : Colors.red,
                              borderRadius:
                                  BorderRadius.circular(
                                      12),
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
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
    
    floatingActionButton: FloatingActionButton(
    onPressed: () async {
      final newBook = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const AddBookPage(),
        ),
      );

      if (newBook != null) {
        setState(() {
          books.add(newBook);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Buku berhasil ditambahkan!"),
          ),
        );
      }
    },
    child: const Icon(Icons.add),
  ),
  );
}
}