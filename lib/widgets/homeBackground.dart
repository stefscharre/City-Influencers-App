
// ignore_for_file: file_names

import 'package:city_influencers_app/pages/signup.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class HomeBackgroundWidget extends StatelessWidget {

  Color color1 = HexColor("#4C525C");

  HomeBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      padding:  EdgeInsets.fromLTRB(2.w,2.w,0,0),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        color: color1,
                        iconSize: 10.w ,
                        onPressed: () {},
                      ),
                    ),
                  
                    Padding(
                      padding:  EdgeInsets.fromLTRB(0,5.w,5.w,0),
                      child: Image.asset('assets/logo.png', height: 7.h),
                    ),

                ],
              ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget> [
                        Padding(
                          padding:  EdgeInsets.only(left:12.w),
                          child: Container(
                              width: 13.h,
                              height: 13.h,
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
