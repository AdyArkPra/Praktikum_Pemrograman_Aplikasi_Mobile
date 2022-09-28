import 'package:flutter/material.dart';
import 'tourism_place.dart';

class DetailPage extends StatefulWidget {
  final TourismPlace place;

  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: (MediaQuery.of(context).size.height) / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Image.network(widget.place.imageUrls[index]),
                );
              },
              itemCount: widget.place.imageUrls.length,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: textBesar(
              "${widget.place.name}",
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
            child: textSedang(
              "${widget.place.location}",
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
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
                        "${widget.place.openDays}\n(${widget.place.openTime})",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    onPressed: null),
                OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Color.fromARGB(0, 255, 255, 255),
                      primary: Color.fromARGB(0, 0, 0, 0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        "Tiket Masuk\n${widget.place.ticketPrice}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    onPressed: null),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Text(
              "${widget.place.description}",
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget textBesar(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget textSedang(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
    );
  }
}
