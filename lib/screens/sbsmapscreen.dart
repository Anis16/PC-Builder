import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SbsMapScreen extends StatefulWidget {
  @override
  _SbsMapScreenState createState() => _SbsMapScreenState();
  int ind;
  SbsMapScreen({ind});
}

class _SbsMapScreenState extends State<SbsMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SBS Informatique Locations"),
          backgroundColor: Colors.pink,
          elevation: 20,
        ),
        body: new FlutterMap(
          options: new MapOptions(
            center: new LatLng(34.056340, -118.232050),
            zoom: 13.0,
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/tazbaki/ckjohsqjt0d2r19qs4f6zytar/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidGF6YmFraSIsImEiOiJja2pvZ3lsMnUwZGQzMnNsMTQ4Z2R6ZGxuIn0.g-mkDdKzUZRE8b0zEG0T4Q",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoidGF6YmFraSIsImEiOiJja2pvZ3lsMnUwZGQzMnNsMTQ4Z2R6ZGxuIn0.g-mkDdKzUZRE8b0zEG0T4Q',
                  'id': 'mapbox.mapbox-streets-v8'
                }),
            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 80.0,
                  height: 90.0,
                  point: new LatLng(34.056340, -118.232050),
                  builder: (context) => Container(
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                          iconSize: 45.0,
                          onPressed: () {},
                        ),
                      ))
            ]),
            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 80.0,
                  height: 90.0,
                  point: new LatLng(34.056340, -117.232050),
                  builder: (context) => Container(
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                          iconSize: 45.0,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (builder) {
                                  return Scaffold(
                                    appBar: AppBar(
                                      title: Column(
                                        children: [
                                          Text("SBS Informatique"),
                                          Text(
                                            "sousse,....",
                                            style: TextStyle(fontSize: 10.0),
                                          )
                                        ],
                                      ),
                                      backgroundColor: Colors.pink,
                                      leading: IconButton(
                                        icon:
                                            Icon(FontAwesomeIcons.mapMarkedAlt),
                                        onPressed: () {},
                                      ),
                                    ),
                                    body: Container(
                                      child: Center(
                                        child: ListView(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 15.0,
                                                  bottom: 5.0),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    RaisedButton.icon(
                                                        icon: Icon(
                                                            FontAwesomeIcons
                                                                .phone),
                                                        label: Text("Call"),
                                                        onPressed: () {
                                                          launch(
                                                              "tel://21213123123");
                                                        }),
                                                    RaisedButton.icon(
                                                        icon: Icon(
                                                            FontAwesomeIcons
                                                                .globe),
                                                        label: Text("Website"),
                                                        onPressed: () {}),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    RaisedButton.icon(
                                                        icon: Icon(
                                                            FontAwesomeIcons
                                                                .facebook),
                                                        label: Text("Facebook"),
                                                        onPressed: () {})
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(1.0),
                                              child: ListTile(
                                                leading: Icon(
                                                    FontAwesomeIcons.facebook),
                                                title: Text(
                                                  "ffffff",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.0),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      ))
            ])
          ],
        ));
  }
}
