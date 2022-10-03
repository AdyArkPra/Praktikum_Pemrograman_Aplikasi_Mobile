import 'details_page.dart';
import 'package:flutter/material.dart';
import 'books_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Library"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemBuilder: (context, index) {
            final BooksData books = booksData[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailsPage(books: books);
                    }),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: 320,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            books.imageLinks,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                          ),
                        )),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            books.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            books.publisher,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: booksData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            mainAxisExtent: 420,
          ),
        ),
      ),
    );
  }
}
