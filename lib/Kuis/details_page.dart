import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'books_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final BooksData books;

  const DetailsPage({Key? key, required this.books}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false;

  // double rating = 4.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isFavorite) ? Color.fromARGB(20, 0, 255, 0) : Colors.white,
      appBar: AppBar(
        title: Text("${widget.books.title}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Image.network(
                widget.books.imageLinks,
                width: 192,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.blueGrey),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: Column(
                children: [
                  Text(
                    "${widget.books.title}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "\nAuthors : ${widget.books.authors}\n\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Color.fromARGB(0, 255, 255, 255),
                            primary: Color.fromARGB(0, 0, 0, 0),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Category : ${widget.books.categories}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                          onPressed: null),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                          ),
                          child: const Text(
                            'Read Book',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            _launchURL("${widget.books.previewLink}");
                          })
                    ],
                  ),
                  Text(
                    "\n${widget.books.description}\n",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.books.publishedDate}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                        child: VerticalDivider(
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "${widget.books.publisher}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
