
// ignore_for_file: file_names

import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:city_influencers_app/pages/signup.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeBackgroundWidget extends StatefulWidget {
  const HomeBackgroundWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeBackgroundWidget();
}

class _HomeBackgroundWidget extends State<HomeBackgroundWidget> {
  Color color1 = HexColor("#4C525C");
  late Future<Influencer?> influencer;
  String points = "";

  @override
  void initState() {
    super.initState();
    InfluencerApi().getInfluencer().then((value) {
      setState(() {
        points = value!.aantalpunten!;
      });
    });

     influencer = InfluencerApi().getInfluencer();
  }

  @override
  Widget build(BuildContext context) {
    void _handleDrawerButton() {
      Scaffold.of(context).openDrawer();
    }

    return Expanded(
        child: Container(
            constraints: BoxConstraints(
              maxHeight: 27.h,
              minHeight: 27.h, //minimum height

              minWidth: MediaQuery.of(context).size.width,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/BackgroundHome.png"),
                    fit: BoxFit.fill)),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(2.w, 2.w, 0, 0),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      color: color1,
                      iconSize: 10.w,
                      onPressed: _handleDrawerButton,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5.w, 5.w, 0),
                    child: Image.asset('assets/logo.png', height: 7.h),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Container(
                      width: 13.h,
                      height: 13.h,
                      child: FutureBuilder<Influencer?>(
                        future: influencer,
                        builder: (BuildContext context,
                            AsyncSnapshot<Influencer?> snapshot) {
                          List<Widget> children;
                          if (snapshot.hasData) {
                            children = <Widget>[

                              Container(
                                width: 13.h,
                                height: 13.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                snapshot.data!.profielfoto!,
                              )
                                  ),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3.0
                                  )
                                ),
                              )

                              
                            ];
                          } else if (snapshot.hasError) {
                            children = <Widget>[
                              const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text('Error: ${snapshot.error}'),
                              )
                            ];
                          } else {
                            children = const <Widget>[
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: CircularProgressIndicator(),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text('Loading...'),
                              )
                            ];
                          }
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: children,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  
                ],
              ),
                  Center(
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text(points + " points", style: TextStyle(
                          fontSize: 20,
                        )),
                      )
                    ],)
                  ),
            ])));
  }
}