import 'package:flutter/material.dart';
import 'package:adminofparty/gold.dart';
import 'package:adminofparty/platinum.dart';
import 'package:adminofparty/silver.dart';
import 'package:adminofparty/special.dart';


class Packages extends StatefulWidget {
  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 206, 107, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(126, 17, 17, 1),
          title: Text("Create Package"),
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            tabs: <Widget>[
              Tab(text: "Silver Package",),
              Tab(text: "Gold Package",),
              Tab(text: "Platinum Package",),
              Tab(text: "Special Package",),
            ],
          )

        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: TabBarView(
            children: <Widget>[
              Silver(),
              Gold(),
              Platinum(),
              Special(),


            ],
          ),
        ),
      ),
    );
  }
}
