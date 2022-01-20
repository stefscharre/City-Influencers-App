import 'package:city_influencers_app/pages/signup.dart';
import 'package:city_influencers_app/widgets/circle.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<Home> {
  Color color1 = HexColor("#4C525C");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints(
              maxHeight: 200,
              minHeight: 200, //minimum height

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
                      padding: const EdgeInsets.fromLTRB(5,5,0,0),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        color: color1,
                        iconSize: 35 ,
                        onPressed: () {},
                      ),
                    ),
                  
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,20,20,0),
                      child: Image.asset('assets/logo.png', height: 50),
                    ),

                ],
              ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget> [
                        Padding(
                          padding: const EdgeInsets.only(left:40),
                          child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/pfp.jpg")),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3.0,
                                ),
                              )),
                        ),
                        
                      ],
                    ),
            ])));
  }
}
