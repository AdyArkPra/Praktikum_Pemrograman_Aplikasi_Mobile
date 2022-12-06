//DIBUAT OLEH ADYATMA ARKAAN PRADIPA - 124200043
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'matches_model.dart';
import 'detail_matches_model.dart';
import 'base_network.dart';

class DetailsPage extends StatefulWidget {
  final MatchesModel? details;

  const DetailsPage({Key? key, required this.details}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isFavorite) ? Colors.green.shade100 : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Match ID : ${widget.details!.id}"),
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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            //color: Colors.black54,
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              FutureBuilder(
                future: BaseNetwork.get('matches/${widget.details!.id}'),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    // debugPrint(snapshot.data);
                    return _buildErrorSection();
                  }
                  if (snapshot.hasData) {
                    return _buildSuccessSection(snapshot.data);
                  }
                  return _buildLoadingSection();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  //DIBUAT OLEH ADYATMA ARKAAN PRADIPA - 124200043

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildSuccessSection(Map<String, dynamic> data) {
    DetailMatchesModel DetailsMatchesModel = DetailMatchesModel.fromJson(data);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40.0),
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
                      border: Border.all(
                        color: Colors.green.withOpacity(0.3),
                        width: 2,
                      )),
                  child: Image.network(
                    'https://countryflagsapi.com/png/${widget!.details!.homeTeam!.name}',
                    fit: BoxFit.fitWidth,
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Text(
                  "${widget!.details!.homeTeam!.name!}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ]),
              Column(children: <Widget>[
                Text(
                  "Goals",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width / 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.withOpacity(0.2),
                      border: Border.all(
                        color: Colors.green.withOpacity(0.3),
                        width: 2,
                      )),
                  child: Text(
                    "${widget!.details!.homeTeam!.goals!} - ${widget!.details!.awayTeam!.goals!}",
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
                      border: Border.all(
                        color: Colors.green.withOpacity(0.3),
                        width: 2,
                      )),
                  child: Image.network(
                    'https://countryflagsapi.com/png/${widget!.details!.awayTeam!.name}',
                    fit: BoxFit.fitWidth,
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Text(
                  "${widget!.details!.awayTeam!.name!}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ]),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Stadium : ${widget.details!.venue}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Location : ${widget.details!.location}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              // border: Border.all(color: Colors.grey.withOpacity(0.4))
            ),
            padding: EdgeInsets.all(5),
            child: Column(children: [
              Text(
                "Statistics",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.4))),
            padding: EdgeInsets.all(16),
            child: Column(children: [
              _BallPossession(
                  DetailsMatchesModel?.homeTeam?.statistics?.ballPossession,
                  DetailsMatchesModel?.awayTeam?.statistics?.ballPossession),
              _Shot(DetailsMatchesModel?.homeTeam?.statistics?.attemptsOnGoal,
                  DetailsMatchesModel?.awayTeam?.statistics?.attemptsOnGoal),
              _ShotOnGoal(
                  DetailsMatchesModel?.homeTeam?.statistics?.kicksOnTarget,
                  DetailsMatchesModel?.awayTeam?.statistics?.kicksOnTarget),
              _Corner(DetailsMatchesModel?.homeTeam?.statistics?.corners,
                  DetailsMatchesModel?.awayTeam?.statistics?.corners),
              _Offside(DetailsMatchesModel?.homeTeam?.statistics?.offsides,
                  DetailsMatchesModel?.awayTeam?.statistics?.offsides),
              _Fouls(
                DetailsMatchesModel?.homeTeam?.statistics?.foulsCommited,
                DetailsMatchesModel?.awayTeam?.statistics?.foulsCommited,
              ),
              _PassAccuracy(
                DetailsMatchesModel?.homeTeam?.statistics?.passes,
                DetailsMatchesModel?.awayTeam?.statistics?.passes,
                DetailsMatchesModel?.homeTeam?.statistics?.passesCompleted,
                DetailsMatchesModel?.awayTeam?.statistics?.passesCompleted,
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Referees",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.details!.officials!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  width: 160,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: [
                    Container(
                      height: 50,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/5/5a/FIFA_Referee.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Text(
                      widget.details!.officials![index].name.toString(),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.details!.officials![index].role.toString(),
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _BallPossession(double? home, double? away) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$home",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "Ball Possesion",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "$away",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _Shot(int? home, int? away) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$home",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "Shot",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "$away",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  //DIBUAT OLEH ADYATMA ARKAAN PRADIPA - 124200043

  Widget _ShotOnGoal(int? home, int? away) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$home",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "Shot On Goal",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "$away",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _Corner(int? home, int? away) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$home",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "Corner",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "$away",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _Offside(int? home, int? away) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$home",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "Offside",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "$away",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _Fouls(int? home, int? away) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$home",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "Fouls",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "$away",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _PassAccuracy(int? home1, int? away1, int? home2, int? away2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${((home2!.toDouble() / home1!.toDouble()) * 100).round()}%",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "Pass Accuracy",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "${((away2!.toDouble() / away1!.toDouble()) * 100).round()}%",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

//DIBUAT OLEH ADYATMA ARKAAN PRADIPA - 124200043
