import 'package:city_influencers_app/pages/signup.dart';
import 'package:city_influencers_app/widgets/bottomMenu.dart';
import 'package:city_influencers_app/widgets/campaign.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:city_influencers_app/widgets/homeBackground.dart';
import 'package:city_influencers_app/widgets/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class DetailPage extends StatefulWidget {

  final String imageurl;
  final String title;
  final String price;
  final String description;

  const DetailPage({Key? key, 
  required this.imageurl,
  required this.title,
  required this.price,
  required this.description}) : super(key: key);

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
            Container(
                          width: 13.h,
                          height: 13.h,
                          child: Column(children: const <Widget>[
                            Icon(Icons.campaign_sharp, size: 60),
                            Text("Campaign")
                          ]),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    widget.imageurl,
                                  )),
                              border:
                                  Border.all(color: Colors.white, width: 3.0)),
                        ),
            Padding(
              padding:  EdgeInsets.fromLTRB(0,2.h,0,2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children:  <Widget>[

                    SizedBox(
                      width: 40.w,
                      child: Text(widget.title,style: const TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold, color: Colors.black),),
                    ),

                  
                  Text(widget.price + " points",style: TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold, color: color3),),
                ]),
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Padding(
                      padding: EdgeInsets.fromLTRB(7.w,0,0,1.h),
                      child:  const Text("Informatie", style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                    padding: EdgeInsets.fromLTRB(7.w,0,7.w,0),
                     child: SizedBox(width: 86.w, child: Text(widget.description)),
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
