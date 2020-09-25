import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';


class InstantPackage extends StatefulWidget {
  @override
  _InstantPackageState createState() => _InstantPackageState();
}

class _InstantPackageState extends State<InstantPackage> {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();
  bool isveg = true;
  final firestoreInstance = FirebaseFirestore.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> vegitems = [];
  List<String> nonvegitems = [];

  addInstantPackage() {
    Map<String, dynamic> packagedata = {
      "name": name,
      "veg": isveg,
      "price": price,
      "Description": description,
      "Items": items,
    };
    CollectionReference mycollection =
        FirebaseFirestore.instance.collection("Instant-Package");
    mycollection.add(packagedata);
  }

  void initState() {
    getVegData();
    getNonVegData();
    getNonVegData2();
    getNonVegData3();

    super.initState();
  }
  showSnackBarforindividual(String item){

    _scaffoldKey.currentState.showSnackBar(SnackBar(

      duration: Duration(seconds: 2),

      backgroundColor: Color.fromRGBO(126, 17, 17, 1),
      content: Row(
        children: <Widget>[
          Container(child: Icon(Icons.thumb_up),),
          SizedBox(width: 8,),
          Text("$item is  added to this package",style: TextStyle(color: Colors.white),)
        ],
      ),

    ));
  }
  showSnackBar(){

    _scaffoldKey.currentState.showSnackBar(SnackBar(

      duration: Duration(seconds: 2),

      backgroundColor: Color.fromRGBO(126, 17, 17, 1),
      content: Row(
        children: <Widget>[
          Container(child: Icon(Icons.thumb_up),),
          SizedBox(width: 8,),
          Text("Your package is added successfully",style: TextStyle(color: Colors.white),)
        ],
      ),

    ));
  }
  getVegData() {
    firestoreInstance
        .collection("Item-Master")
        .where("category", isEqualTo: "veg")
        .get()
        .then((value) {
      value.docs.forEach((result) {
        vegitems.add(result.data()["item-name"]);
      });
    });
  }

  getNonVegData() {
    firestoreInstance
        .collection("Item-Master")
        .where("category", isEqualTo: "mutton")
        .get()
        .then((value) {
      value.docs.forEach((result) {
        nonvegitems.add(result.data()["item-name"]);
      });
    });
  }

  getNonVegData2() {
    firestoreInstance
        .collection("Item-Master")
        .where("category", isEqualTo: "chicken")
        .get()
        .then((value) {
      value.docs.forEach((result) {
        nonvegitems.add(result.data()["item-name"]);
      });
    });
  }

  getNonVegData3() {
    firestoreInstance
        .collection("Item-Master")
        .where("category", isEqualTo: "sea-food")
        .get()
        .then((value) {
      value.docs.forEach((result) {
        nonvegitems.add(result.data()["item-name"]);
      });
    });
  }

  Future selectImage() async {
    final _image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      image = File(_image.path);
    });
  }

  File image;
  int counter = 0;
  List<String> items = [];
  bool isselected;
  String name;
  String description;
  double price;

  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(255, 206, 107, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(126, 17, 17, 1),
        title: Text("Create Instant-Package"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Form(
              key: myKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 190,
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: SwitchListTile(
                      title: Text("Vegetarian Package"),
                      dense: true,
                      value: isveg,
                      inactiveTrackColor: Color.fromRGBO(126, 17, 17, 1),
                      activeColor: Color.fromRGBO(126, 17, 17, 1),
                      onChanged: (bool val) {
                        setState(() {
                          isveg = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                                20) //                 <--- border radius here
                            ),
                        border: Border.all(
                          color: Color.fromRGBO(126, 17, 17, 1),
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Package Name",
                            contentPadding: EdgeInsets.all(10)),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Item name is required";
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                                20) //                 <--- border radius here
                            ),
                        border: Border.all(
                          color: Color.fromRGBO(126, 17, 17, 1),
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Package Price",
                            contentPadding: EdgeInsets.all(10)),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Item price is required";
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          setState(() {
                            price = double.parse(value);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                                20) //                 <--- border radius here
                            ),
                        border: Border.all(
                          color: Color.fromRGBO(126, 17, 17, 1),
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        maxLines: 6,
                        decoration: InputDecoration(
                            hintText: "Package Description",
                            contentPadding: EdgeInsets.all(10)),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "description is required";
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          setState(() {
                            description = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                                30) //                 <--- border radius here
                            ),
                        border: Border.all(
                          color: Color.fromRGBO(126, 17, 17, 1),
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: image == null
                          ? Center(
                              child: RaisedButton.icon(
                                  color: Color.fromRGBO(126, 17, 17, 1),
                                  onPressed: () {
                                    selectImage();

//                        FirebaseStorage fs =FirebaseStorage.instance;
//
//                        StorageReference rr=fs.ref();
//                        StorageReference picturefolder= rr.child("photos").child("image");
//                        picturefolder.putFile(image).onComplete.then((task) async {
//                        String link = await task.ref.getDownloadURL();
//                        setState(() {
//                          imageurl=link;
//                          print(imageurl);
//                        });
//
//                        } );
                                  },
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "Add Image",
                                    style: TextStyle(color: Colors.white),
                                  )))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.file(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                      width: screenwidth,
                      height: screenheight / 2 - 150,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 330,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                                padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    isveg == true
                                        ? Text(
                                            vegitems[index],
                                            style: TextStyle(fontSize: 28),
                                          )
                                        : Text(
                                            nonvegitems[index],
                                            style: TextStyle(fontSize: 28),
                                          ),
                                    RaisedButton(
                                        child:Text("add",style: TextStyle(color: Colors.white),),
                                        color: Color.fromRGBO(126, 17, 17, 1),
                                        onPressed: () {
                                          showSnackBarforindividual(isveg == true
                                              ? vegitems[index]
                                              : nonvegitems[index]);
                                          items.add(isveg == true
                                              ? vegitems[index]
                                              : nonvegitems[index]);
                                        })
                                  ],
                                ));
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: isveg == true
                              ? vegitems.length
                              : nonvegitems.length)),
                  RaisedButton.icon(
                    color: Color.fromRGBO(126, 17, 17, 1),
                    onPressed: () {
                      if (myKey.currentState.validate()) {
                        myKey.currentState.save();
                      }
                      addInstantPackage();
                      showSnackBar();
                    },
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
