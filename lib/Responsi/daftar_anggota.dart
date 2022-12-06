import 'package:flutter/material.dart';
import 'data_anggota.dart';

class DaftarAnggota extends StatelessWidget {
  const DaftarAnggota({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Anggota'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemBuilder: (context, index) {
              final DataAnggota anggota = dataAnggota[index];
              return Card(
                color: Colors.green.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        anggota.foto,
                        fit: BoxFit.cover,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      ),
                      ListTile(
                        // leading: Icon(Icons.arrow_drop_down_circle),
                        title: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              anggota.nama,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )

                        ),
                        subtitle: Text(
                          anggota.nim,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
              );
            },
            itemCount: dataAnggota.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              mainAxisExtent: 280,
            ),
          ),
        ),
      ),
    );
  }
}
