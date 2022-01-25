import 'package:city_influencers_app/pages/signup.dart';
import 'package:city_influencers_app/widgets/bottomMenu.dart';
import 'package:city_influencers_app/widgets/campaign.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:city_influencers_app/widgets/homeBackground.dart';
import 'package:city_influencers_app/widgets/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<Home> {
  Color color1 = HexColor("#4C525C");
  Color color2 = HexColor("#EBEBEB");
 
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
              padding: EdgeInsets.fromLTRB(3.5.w,3.w,0,3.w),
               child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Campagnes",
                style: TextStyle(
                    fontSize: 36, fontWeight: FontWeight.bold, color: color1),
              ),
              
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            SizedBox(
                      width: 60.w,
            child: Padding(
              padding:  EdgeInsets.only(left:3.5.w),
              
              child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: color2,
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
            ),),]),
            const CampaignWidget(
                imageurl: 'assets/biefstukFriet.jpg',
                text: "Restaurant Bij Den Steak",
                price: 250),
            const CampaignWidget(
                imageurl: 'assets/biefstukFriet.jpg', text: "Hey", price: 800),
                
          ]
          ),

          const Align(
            
            alignment: Alignment.bottomCenter,
            
            child: MenuWidget()
          )]
        )
        
        
        );
  }
}
