import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:data_connection_checker/data_connection_checker.dart';
import 'model.dart';

// ignore: must_be_immutable
class World extends StatefulWidget {
  Color bgcolor = Colors.white;
  Color textcolor = Colors.black;
  Color appbarcolor = Colors.blueAccent;
  World({Key key, this.bgcolor, this.textcolor, this.appbarcolor})
      : super(key: key);
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  List<Api> user = [];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "World Covid-19 Data",
        )),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images.png"),
            fit: BoxFit.cover,
          ),
        ),
        // margin: const EdgeInsets.only(top: 20),
        child: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                  // child: CircularProgressIndicator(color: Colors.pink)
                  );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("error in snapshot");
              } else {
                return ListView.builder(
                    itemBuilder: (context, i) => Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width: width * 0.4,
                                      margin: const EdgeInsets.all(5),
                                      padding: const EdgeInsets.all(6),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        snapshot.data[i].country,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            "Cases",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text("Deaths",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87))),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            "Today Deaths",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            "Recovered",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            "Today Recovered",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            "Active",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            "Critical",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            "Tests",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            "Updated",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            "TotalPopulation",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black87,
                                            ),
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                              ":  " +
                                                  snapshot.data[i].cases
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87))),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            ":  " +
                                                snapshot.data[i].deaths
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            ":  " +
                                                snapshot.data[i].todayDeaths
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            ":  " +
                                                snapshot.data[i].recovered
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            ":  " +
                                                snapshot.data[i].todayRecovered
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            ":  " +
                                                snapshot.data[i].active
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            ":  " +
                                                snapshot.data[i].critical
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            ":  " +
                                                snapshot.data[i].tests
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            ":  " +
                                                snapshot.data[i].updated
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                      Container(
                                          width: width * 0.4,
                                          child: Text(
                                            ":  " +
                                                snapshot.data[i].population
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
              }
            } else {
              return Center(
                  // child: CircularProgressIndicator(color: Colors.black),
                  );
            }
          },
        ),
      ),
    );
  }

  Future getdata() async {
    try {
      DataConnectionStatus status = await internetcheck();
      if (status == DataConnectionStatus.connected) {
        var uri = Uri.parse("https://disease.sh/v3/covid-19/countries");
        var response = await http.get(uri);
        var data = jsonDecode(response.body);
        for (var u in data) {
          Api api = Api(
              u["updated"],
              u["cases"],
              u["todayCases"],
              u["deaths"],
              u["todayDeaths"],
              u["recovered"],
              u["todayRecovered"],
              u["active"],
              u["country"],
              u["tests"],
              u["population"],
              u["critical"]);
          user.add(api);
        }
        // print(user.length);
        return user;
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Center(child: Text("No internet connection")),
                content: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text("check your internet connection"),
                    SizedBox(height: 15),
                    Center(
                      child: ElevatedButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => World()),
                            (r) => false),
                      ),
                    )
                  ],
                )),
              );
            });
        return null;
      }
    } catch (e) {
      return "error";
    }
  }

  internetcheck() async {
    return await DataConnectionChecker().connectionStatus;
  }
}
