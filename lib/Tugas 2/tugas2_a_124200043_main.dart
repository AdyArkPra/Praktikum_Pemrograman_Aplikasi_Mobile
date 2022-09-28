// ---------- TUGAS 2 - 124200043 - ADYATMA ARKAAN PRADIPA ---------- //
import 'package:flutter/material.dart';
import 'tugas2_a_1242000043_detail.dart';
import 'tourism_place.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Destinasi Wisata';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.amber,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final TourismPlace place = tourismPlaceList[index];
            return Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                color: Color.fromARGB(233, 235, 230, 215),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      place.imageUrls[0],
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                    ListTile(
                      //leading: Icon(Icons.arrow_drop_down_circle),
                      title: Text(
                        place.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        place.ticketPrice,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 35,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(13.0)),
                                ),
                                child: const Text(
                                  'More details',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return DetailPage(place: place);
                                    }),
                                  );
                                })),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: tourismPlaceList.length,
        ),
      ),
    );
  }
}
