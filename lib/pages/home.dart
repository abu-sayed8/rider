import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/pages/login_page.dart';
import 'package:rider_app/widgets/widget.dart';
class Home extends StatefulWidget {
  static const String idScreen="home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GoogleMapController newGoogleMapController;
  Completer<GoogleMapController> _googleMapController = Completer();

  GlobalKey<ScaffoldState> _scaffolodKey=new GlobalKey<ScaffoldState>();

  Position currentPosition;
  var geoLocator=Geolocator();
  double bottomPaddingOfMap=0.0;

  void locatePosition() async{
    Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition=position;

    LatLng latLngPosition=LatLng(position.latitude,position.longitude);
    
    CameraPosition cameraPosition=new CameraPosition(target: latLngPosition,zoom: 14);
    
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffolodKey,
      appBar: AppBar(title: Text('Home',textAlign: TextAlign.center,),centerTitle: true,),
      drawer:Container(
        color:Colors.white,
        width: size.width*.7,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: size.height*.2,
                child:DrawerHeader(
                  decoration: BoxDecoration(
                    color:Colors.white
                  ),
                  child: Row(
                    children: [
                      Image.asset("asset/images/user_icon.png",
                        height: size.width*.2,width: size.width*.2,),
                      SizedBox(width: size.width*.02),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Profile name",
                          style: TextStyle(fontSize: size.height*.025,fontFamily: "Brand-Bold"),),
                          SizedBox(height: 6.0,),
                          Text("Visit Profile",
                            //style: TextStyle(fontSize: size.height*.025,fontFamily: "Brand-Bold"),
                          ),

                        ],
                      )
                    ],
                  ),
                )
              ),
              dividerWidgets(context),
              SizedBox(height: 12.0,),
              ///Drawer body
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History",style: TextStyle(fontSize: size.height*.022),),
              ),

            ListTile(
                leading: Icon(Icons.person),
                title: Text("Visit Profile",style: TextStyle(fontSize: size.height*.022),),
              ),

            ListTile(
                leading: Icon(Icons.info),
                title: Text("About",style: TextStyle(fontSize: size.height*.022),),
              ),

            GestureDetector(
              onTap: ()=>Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>Login())),
              child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout",style: TextStyle(fontSize: size.height*.022),),
                ),
            ),


            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            //markers: Marker,

            onMapCreated: (GoogleMapController controller){
              _googleMapController.complete(controller);
              newGoogleMapController=controller;

              setState(() {
                bottomPaddingOfMap=size.height*.32;
              });

              locatePosition();
            },
          ),
          ///Hamburger button for drawer
          Positioned(
            top: 45.0,
            left: 152.0,
            child: GestureDetector(
              onTap: ()=>_scaffolodKey.currentState.openDrawer(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 6.0,
                      spreadRadius: 0.5,
                      offset: Offset(
                        0.7,
                        0.7,
                      ),
                    ),
                  ]
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.menu,color: Colors.black,),
                  radius: 20.0,
                ),
              ),
            ),
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: size.height*0.32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 16.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7,0.7)
                    )
                  ]
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6.0,),
                      Text("Hi there, ",style: TextStyle(fontSize: size.height*.02,color: Colors.black54),),
                      Text("Where to?, ",
                        style: TextStyle(fontSize: size.height*.024,fontFamily: "Brand-Bold",color: Colors.black54),),
                      SizedBox(height: 10.0,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 6.0,
                                  spreadRadius: 0.5,
                                  offset: Offset(0.7,0.7)
                              )
                            ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(Icons.search,color: Colors.grey[500],),
                              SizedBox(width: size.width*0.01,),
                              Text("Search Drop off",style: TextStyle(color: Colors.grey[700]),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Icon(Icons.home,color: Colors.grey,),
                          SizedBox(
                            width: size.width*.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Home",style: TextStyle(color: Colors.black54),),
                              SizedBox(height: 4.0,),
                              Text("Your Living home address",
                                style: TextStyle(color: Colors.grey[500],
                                  fontSize: size.height*.02,)),
                            ],
                          )
                        ],
                      ),
                    SizedBox(height: 10.0,),
                      dividerWidgets(context),
                      SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Icon(Icons.work,color: Colors.grey,),
                          SizedBox(
                            width: size.width*.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Work",style: TextStyle(color: Colors.black54),),
                              SizedBox(height: 4.0,),
                              Text("Your Work address",
                                style: TextStyle(color: Colors.grey[500],
                                  fontSize: size.height*.02,)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
