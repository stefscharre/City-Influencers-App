import 'package:city_influencers_app/pages/signup.dart';
import 'package:city_influencers_app/widgets/bottomMenu.dart';
import 'package:city_influencers_app/widgets/campaign.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:city_influencers_app/widgets/homeBackground.dart';
import 'package:city_influencers_app/widgets/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  Color color1 = HexColor("#4C525C");
  Color color2 = HexColor("#EBEBEB");
  Color color3 = HexColor("#34B6C6");
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: const NavDrawer(),
        body: Stack(
          children: [
          Column(
              children: <Widget>[
            Row(children: <Widget>[
              HomeBackgroundWidget(),
            ]),
            Padding(
              padding:  EdgeInsets.only(top: 3.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25), 
  child: SizedBox.fromSize(
           child: Image.asset('assets/biefstukFriet.jpg', width: 55.w, fit: BoxFit.cover)),
),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(0,2.h,0,2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children:  <Widget>[

                    SizedBox(
                      width: 40.w,
                      child: const Text("Restaurant bij den Steak",style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold, color: Colors.black),),
                    ),

                  
                  Text("€250",style: TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold, color: color3),),
                ]),
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Padding(
                      padding: EdgeInsets.fromLTRB(7.w,0,0,1.h),
                      child:  Text("Informatie", style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                    padding: EdgeInsets.fromLTRB(7.w,0,7.w,0),
                     child: SizedBox(width: 86.w, child: const Text("Een tekst is, ruim gedefinieerd, een reeks talige tekens, zoals letters, symbolen of klanken, die in een communicatieve situatie als een geheel wordt ervaren. Een tekst kan dus zowel geschreven als ongeschreven zijn.")),
                   ),
                 ],
               ),
              
          ]
          ),
          

          const Align(
            
            alignment: Alignment.bottomCenter,
            
            child: MenuWidget()
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: 10.h),
            child: Align(
      alignment: Alignment.bottomCenter,
                child: ElevatedButton(
              
              child: const Text('Doe mee'),
                   style: ElevatedButton.styleFrom(
                      primary: color3,
                      padding:  EdgeInsets.symmetric(horizontal: 6.w),
                      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25), // <-- Radius
    ),
                      textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
                  onPressed: () {},

                ),
                ),
          ),]
          
        )
        
        
        );
  }
}
