import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Platinum extends StatefulWidget {
  @override
  _PlatinumState createState() => _PlatinumState();
}

class _PlatinumState extends State<Platinum> {



  addDataofPlatinum(){
    Map<String,dynamic> packagedata={
      "name":"Platinum-Package",
      "Staters":["$stater1","$stater2","$stater3"],
      "Main-Course":["$maincourse1","$maincourse2","$maincourse3"],
      "Desserts":["$dessert1","$dessert2","$dessert3"],
      "Beverages":["$beverage1","$beverage2","$beverage3"],

    };
    CollectionReference mycollection =FirebaseFirestore.instance.collection("Standard-Package");
    mycollection.add(packagedata);

  }
  void initState() {
    forstaters();
    formaincourse();
    fordesserts();
    forbeverages();

    super.initState();
  }
  final firestoreInstance = FirebaseFirestore.instance;
  void forstaters() {
    firestoreInstance
        .collection("Item-Master")
        .where("course", isEqualTo: "stater")
        .get()
        .then((value) {
      value.docs.forEach((result) {

          setState(() {
            staters.add(result.data()["item-name"]);
          });


      });
    });
  }
  void formaincourse() {
    firestoreInstance
        .collection("Item-Master")
        .where("course", isEqualTo: "main-course")
        .get()
        .then((value) {
      value.docs.forEach((result) {

        setState(() {
          maincourse.add(result.data()["item-name"]);
        });


      });
    });
  }
  void fordesserts() {
    firestoreInstance
        .collection("Item-Master")
        .where("course", isEqualTo: "dessert")
        .get()
        .then((value) {
      value.docs.forEach((result) {

          setState(() {
            desserts.add(result.data()["item-name"]);
          });


      });
    });
  }
  void forbeverages() {
    firestoreInstance
        .collection("Item-Master")
        .where("course", isEqualTo: "beverages")
        .get()
        .then((value) {
      value.docs.forEach((result) {

        setState(() {
          beverages.add(result.data()["item-name"]);
        });


      });
    });
  }



  List<String> staters=[];
  List<String> maincourse=[];
  List<String> desserts=[];
  List<String> beverages=[];
  String dessert1;
  String dessert2;
  String dessert3;
  String beverage1;
  String beverage2;
  String beverage3;
  String maincourse1;
  String maincourse2;
  String maincourse3;
  String stater1;
  String stater2;
  String stater3;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: ListView(
//       crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Staters",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Stater 1",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: stater1,
                      items: staters.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          stater1=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Stater 2",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: stater2,
                      items: staters.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          stater2=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Stater 3",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: stater3,
                      items: staters.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          stater3=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Main Course",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Main-Course1",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: maincourse1,
                      items: maincourse.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          maincourse1=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Main-Course 2",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: maincourse2,
                      items: maincourse.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          maincourse2=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Main-Course 3",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: maincourse3,
                      items: maincourse.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          maincourse3=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Dessert",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Dessert-1",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: dessert1,
                      items: desserts.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          dessert1=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Dessert-2",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: dessert2,
                      items: desserts.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          dessert2=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Dessert-3",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: dessert3,
                      items: desserts.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          dessert3=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Beverages",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Beverages-1",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: beverage1,
                      items: beverages.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          beverage1=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Beverage-2",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: beverage2,
                      items: beverages.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          beverage2=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                color: Color.fromRGBO(126, 17, 17, 1),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:  Color.fromRGBO(126, 17, 17, 1)
                  ),
                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(isExpanded: true,hint: Text("Beverage-3",style: TextStyle(color: Colors.white70),),

                      iconEnabledColor: Colors.white,


                      style: TextStyle(color: Colors.white,),

                      value: beverage3,
                      items: beverages.map((String dropDownString){
                        return DropdownMenuItem<String>(
                          value: dropDownString,
                          child: Text(dropDownString),
                        );

                      }).toList(),
                      onChanged: (String selectedValue) {
                        setState(() {
                          beverage3=selectedValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            RaisedButton.icon(color:Color.fromRGBO(126, 17, 17, 1),onPressed: () {
              addDataofPlatinum();
            }, icon: Icon(Icons.check,color: Colors.white,),label: Text("Submit",style: TextStyle(color: Colors.white),),)






          ],

        )

    );
  }
}

