// ignore_for_file: file_names

import 'package:city_influencers_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _navigateToHome() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
    
  }
    Color color1 = HexColor("#4C525C");
    return Stack(children: [
       Divider(

            thickness: 1,

            color: color1,
          ),
       Padding(
      padding: EdgeInsets.fromLTRB(0,1.5.h,0,1.5.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
          icon: Icon(
              Icons.home,
              color: color1,
              size: 40,
            ),
          onPressed: () {_navigateToHome();
          },
        ),
         IconButton(
          icon:  Icon(
              Icons.add,
              color: color1,
              size: 40,
            ),
          onPressed: () {
          },
        ),
         IconButton(
          icon:  Icon(
              Icons.mail,
              color: color1,
              size: 40,
            ),
          onPressed: () {
          },
        ),
         IconButton(
          icon:  Icon(
              Icons.person,
              color: color1,
              size: 40,
            ),
          onPressed: () {
          },
        ),
            
            
            
            
          ]),
    ),
    ]);
             
   
  }
}
