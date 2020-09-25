import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:adminofparty/instantpackage.dart';
import 'dart:io';
import 'package:adminofparty/packages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MainScreen(),
    debugShowCheckedModeBanner: false,
  ));
}


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  showSnackBar(){

    _scaffoldKey.currentState.showSnackBar(SnackBar(

      duration: Duration(seconds: 2),

      backgroundColor: Color.fromRGBO(126, 17, 17, 1),
      content: Row(
        children: <Widget>[
          Container(child: Icon(Icons.thumb_up),),
          SizedBox(width: 8,),
          Text("${name} is  added to FireStore",style: TextStyle(color: Colors.white),)
        ],
      ),

    ));
  }


addData(){



    Map<String,dynamic> mydata={
      "item-name":name,
      "price":price,
      "item-description":description,
      "available":available,
      "special-offer":special_offer,
      "banner":banner,
      "category":category,
      "course":course,
      "sub-category" :sub_category,
      "regional-category":regional,
      "image-url":imageurl

    };
//
  CollectionReference mycollection =Firestore.instance.collection("Item-Master");
  mycollection.add(mydata);




}


 Future selectImage() async{
   final _image= await ImagePicker().getImage(source: ImageSource.gallery);
   setState(() {
     image=File(_image.path);
   });
 }
  String course;
  String category;
  String sub_category;
  String regional;


  File image;
  String imageurl;
  double price;
  String name;
  String description;
  bool available = false;
  bool special_offer = false;
  bool banner = false;
  bool todayspecial = false;
  bool veg=false;
  bool chicken=false;
  bool mutton=false;
  bool seafood=false;
  bool stater=false;
  bool maincourse=false;
  bool dessert=false;
  bool beverage=false;
  bool salad=false;
  bool rice=false;
  bool bread=false;
  bool curry=false;
  bool fry=false;
  bool soup=false;
  bool haleem=false;
  bool southindian=false;
  bool bbq=false;
  bool fastfood=false;
  bool arabian=false;
  bool chinese=false;
  bool rajesthani=false;
  bool hyderabadi=false;
  bool gujrati=false;


  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(255, 206, 107, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(126, 17, 17, 1),
        title: Text("Partywala Admin Panel"),

      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 50, 5,5),
          color: Color.fromRGBO(126, 17, 17, 1),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              ListTile(leading: Icon(Icons.business_center,color: Colors.white,),
                title: Text("Create Package",style: TextStyle(color: Colors.white),),
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Packages()));

                },),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:1.0,
                  width:double.infinity,
                  color:Colors.white,),),
              ListTile(leading: Icon(Icons.card_giftcard,color: Colors.white),
                title: Text("Create Instant-Package",style: TextStyle(color: Colors.white)),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>InstantPackage()));

                },),

            ],
          )
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Form(
              key: myKey,
              child: Column(
                children: <Widget>[
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
                            hintText: "Item Name",
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
                            hintText: "Item Price",
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
                            hintText: "Item Description",
                            contentPadding: EdgeInsets.all(10)),
                        validator: ( value) {
                          if (value.isEmpty) {
                            return "description is required";
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          setState(() {
                            description = value ;
                          });
                        },
                      ),
                    ),
                  ),

                  Column(
                    children: <Widget>[
                      Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 180,
                           child: Row(
                             children: <Widget>[
                               Checkbox(
                                 activeColor: Color.fromRGBO(126, 17, 17, 1),

                                 value: available,onChanged: (bool val){
                                 setState(() {
                                   available=val;
                                 });
                               },),
                               Text("Available")
                             ],
                           )
                          ),
                          Container(
                            width: 180,
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    activeColor: Color.fromRGBO(126, 17, 17, 1),

                                    value: special_offer,onChanged: (bool val){
                                    setState(() {
                                      special_offer=val;
                                    });
                                  },),
                                  Text("Special Offer")
                                ],
                              )
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 180,
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    activeColor: Color.fromRGBO(126, 17, 17, 1),

                                    value: banner,onChanged: (bool val){
                                    setState(() {
                                      banner=val;
                                    });
                                  },),
                                  Text("Banner")
                                ],
                              )
                          ),
                          Container(
                            width: 180,
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    activeColor: Color.fromRGBO(126, 17, 17, 1),

                                    value: todayspecial,onChanged: (bool val){
                                    setState(() {
                                      todayspecial=val;
                                    });
                                  },),
                                  Text("Today's Special")
                                ],
                              )
                          )
                        ],
                      )

                    ],
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


                        child: image==null? Center(child: RaisedButton.icon(color:Color.fromRGBO(126, 17, 17, 1),onPressed: ()  {selectImage();



                        }, icon: Icon(Icons.add_a_photo,color: Colors.white,), label:
                        Text("Add Image",style: TextStyle(color:Colors.white ),))): ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(image,fit:BoxFit.cover,),
                        ),

                      width: screenwidth,
                      height: screenheight/2-150,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Category",style: TextStyle(fontSize: 24,),),
                      Text("Course",style: TextStyle(fontSize: 24,)),

                    ],
                  ),   SizedBox(height: 5,),
                  ClipRRect(
                     borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: screenwidth,
                      height: screenheight/2-200,

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
                      child: Row(

                        children: <Widget>[
                          Column(

                            children: <Widget>[
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: veg,onChanged: (bool val){
                                      setState(() {
                                        veg=val;
                                        category="veg";
                                      });
                                    },),
                                    Text("Veg")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: chicken,onChanged: (bool val){
                                      setState(() {
                                        chicken=val;
                                        category="chicken";
                                      });
                                    },),
                                    Text("Chicken")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: mutton,onChanged: (bool val){
                                      setState(() {
                                        mutton=val;
                                        category="mutton";
                                      });
                                    },),
                                    Text("Mutton")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: seafood,onChanged: (bool val){
                                      setState(() {
                                        seafood=val;
                                        category="sea-food";
                                      });
                                    },),
                                    Text("Sea-Food")
                                  ],
                                ),
                              ),


                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: stater,onChanged: (bool val){
                                      setState(() {
                                        stater=val;
                                        course="stater";
                                      });
                                    },),
                                    Text("Stater")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: maincourse,onChanged: (bool val){
                                      setState(() {
                                        maincourse=val;
                                        course="main-course";
                                      });
                                    },),
                                    Text("Main Course")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: dessert,onChanged: (bool val){
                                      setState(() {
                                        dessert=val;
                                        course="dessert";
                                      });
                                    },),
                                    Text("Desserts")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: beverage,onChanged: (bool val){
                                      setState(() {
                                        beverage=val;
                                        course="beverages";
                                      });
                                    },),
                                    Text("Beverage")
                                  ],
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Sub Category",style: TextStyle(fontSize: 24,)),
                  SizedBox(height: 5,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: screenwidth,
                      height: screenheight/2-150,

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
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: salad,onChanged: (bool val){
                                      setState(() {
                                        salad=val;
                                        sub_category="salad";
                                      });
                                    },),
                                    Text("Salad")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: rice,onChanged: (bool val){
                                      setState(() {
                                        rice=val;
                                        sub_category="rice";
                                      });
                                    },),
                                    Text("Rice")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: bread,onChanged: (bool val){
                                      setState(() {
                                        bread=val;
                                        sub_category="bread";
                                      });
                                    },),
                                    Text("Bread")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: curry,onChanged: (bool val){
                                      setState(() {
                                        curry=val;
                                        sub_category="curry";
                                      });
                                    },),
                                    Text("Curry")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: fry,onChanged: (bool val){
                                      setState(() {
                                        fry=val;
                                        sub_category="fry";
                                      });
                                    },),
                                    Text("Fry")
                                  ],
                                ),
                              )


                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: soup,onChanged: (bool val){
                                      setState(() {
                                        soup=val;
                                        sub_category="soup";
                                      });
                                    },),
                                    Text("Soup")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: haleem,onChanged: (bool val){
                                      setState(() {
                                        haleem=val;
                                        sub_category="haleem";
                                      });
                                    },),
                                    Text("Haleem")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: southindian,onChanged: (bool val){
                                      setState(() {
                                        southindian=val;
                                        sub_category="south-indian";
                                      });
                                    },),
                                    Text("South Indian")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: bbq,onChanged: (bool val){
                                      setState(() {
                                        bbq=val;
                                        sub_category="bbq";
                                      });
                                    },),
                                    Text("BBQ")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: fastfood,onChanged: (bool val){
                                      setState(() {
                                        fastfood=val;
                                        sub_category="fast-food";
                                      });
                                    },),
                                    Text("Fast-Food")
                                  ],
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Select Regional Category",style: TextStyle(fontSize: 24,)),
                  SizedBox(height: 5,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: screenwidth,
                      height: screenheight/2-150,

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
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: arabian,onChanged: (bool val){
                                      setState(() {
                                        arabian=val;
                                        regional="arabian";
                                      });
                                    },),
                                    Text("Arabian")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: chinese,onChanged: (bool val){
                                      setState(() {
                                        chinese=val;
                                        regional="chinese";
                                      });
                                    },),
                                    Text("Chinese")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: rajesthani,onChanged: (bool val){
                                      setState(() {
                                        rajesthani=val;
                                        regional="rajesthani";
                                      });
                                    },),
                                    Text("Rajesthani")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: hyderabadi,onChanged: (bool val){
                                      setState(() {
                                        hyderabadi=val;
                                        regional="hyderabadi";
                                      });
                                    },),
                                    Text("Hyderabadi")
                                  ],
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color.fromRGBO(126, 17, 17, 1),

                                      value: gujrati,onChanged: (bool val){
                                      setState(() {
                                        gujrati=val;
                                        regional="gujrati";
                                      });
                                    },),
                                    Text("Gujrati")
                                  ],
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
        RaisedButton.icon(color:Color.fromRGBO(126, 17, 17, 1),onPressed: () {
          myKey.currentState.validate();
          if(myKey.currentState.validate()){
            myKey.currentState.save();
          };
          addData();
          showSnackBar();
          myKey.currentState.reset();

          setState(() {
             price=0.0;
             name="";
             description="add next";
             available = false;
             special_offer = false;
             banner = false;
             todayspecial = false;
             veg=false;
             chicken=false;
             mutton=false;
             seafood=false;
             stater=false;
             maincourse=false;
             dessert=false;
             beverage=false;
             salad=false;
             rice=false;
             bread=false;
             curry=false;
             fry=false;
             soup=false;
             haleem=false;
             southindian=false;
             bbq=false;
             fastfood=false;
             arabian=false;
             chinese=false;
             rajesthani=false;
             hyderabadi=false;
             gujrati=false;

          });




        }, icon: Icon(Icons.check,color: Colors.white,),label: Text("Submit",style: TextStyle(color: Colors.white),),)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
