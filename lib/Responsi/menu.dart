//DIBUAT OLEH ADYATMA ARKAAN PRADIPA - 124200043

import 'package:flutter/material.dart';
import 'base_network.dart';
import 'matches_model.dart';
import 'details.dart';

class menu extends StatelessWidget {
  const menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text("World Cup")),
      body: const _menuState(),
    );
  }
}

class _menuState extends StatelessWidget {
  const _menuState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: BaseNetwork.getList('matches'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            return _buildSuccessSection(snapshot.data);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  //DIBUAT OLEH ADYATMA ARKAAN PRADIPA - 124200043

  Widget _buildSuccessSection(List<dynamic> data) {
    return ListView.builder(
      itemCount: 48,
      itemBuilder: (BuildContext context, int index) {
        MatchesModel matchesModel = MatchesModel.fromJson(data[index]);
        return Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: InkWell(
                child: Card(
                  color: Colors.green.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(0.0),
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //   color: Colors.grey,
                                //   width: 2,
                                // )
                              ),
                              child: Image.network(
                                'https://countryflagsapi.com/png/${matchesModel!.homeTeam!.name}',
                                fit: BoxFit.fitWidth,
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Text(
                              "${matchesModel!.homeTeam!.name!}",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ]),
                          Column(children: <Widget>[
                            Text(
                              "Goals",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              width: MediaQuery.of(context).size.width / 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                // border: Border.all(
                                //   color: Colors.grey,
                                //   width: 2,
                                // )
                              ),
                              child: Text(
                                "${matchesModel!.homeTeam!.goals!} - ${matchesModel!.awayTeam!.goals!}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                          Column(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(0.0),
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //   color: Colors.grey,
                                //   width: 2,
                                // )
                              ),
                              child: Image.network(
                                'https://countryflagsapi.com/png/${matchesModel!.awayTeam!.name}',
                                fit: BoxFit.fitWidth,
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Text(
                              "${matchesModel!.awayTeam!.name!}",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailsPage(details: matchesModel);
                    }))
            )
        );
      },
    );
  }
}
//DIBUAT OLEH ADYATMA ARKAAN PRADIPA - 124200043