import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Silver extends StatefulWidget {
  @override
  _SilverState createState() => _SilverState();
}

class _SilverState extends State<Silver> {
  void initState() {

    forstaters();
    formaincourse();
    fordesserts();
    forbeverages();
    print(staters);
    super.initState();
  }
  @override


  addDataofSilver(){
    Map packagedata={
      "name":"Silver-Package",
      "Staters":["$stater1","$stater2"],
      "Main-Course":["$maincourse1","$maincourse2"],
      "Desserts":["$dessert1","$dessert2"],
      "Beverages":["$beverage1","$beverage2"],

    };
    CollectionReference mycollection =FirebaseFirestore.instance.collection("Standard-Package");
    mycollection.add(packagedata);

  }




  final myInstance = FirebaseFirestore.instance;
  void forstaters() {

    myInstance
        .collection("Item-Master")
        .where("course", isEqualTo: "stater")
        .get()
        .then((value) {
      value.docs.forEach((doc) {

     setState(() {

    staters.add(doc.data()["item-name"]);
     });


      });
    });
  }
  void formaincourse() {
    myInstance
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
    myInstance
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
    myInstance
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
  String beverage1;
  String beverage2;
  String maincourse1;
  String maincourse2;
  String stater1;
  String stater2;

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
         SizedBox(height: 50,),
         RaisedButton.icon(color:Color.fromRGBO(126, 17, 17, 1),onPressed: () {

           addDataofSilver();
         }, icon: Icon(Icons.check,color: Colors.white,),label: Text("Submit",style: TextStyle(color: Colors.white),),)






       ],

     )
    );
  }
}
