import 'package:city_influencers_app/apis/city_api.dart';
import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/models/city.dart';
import 'package:city_influencers_app/models/influencer.dart';

import 'package:city_influencers_app/models/influencerApiResponse.dart';
import 'package:city_influencers_app/pages/signup.dart';

import 'package:city_influencers_app/widgets/bottomMenu.dart';
import 'package:city_influencers_app/widgets/campaign.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:city_influencers_app/widgets/homeBackground.dart';
import 'package:city_influencers_app/widgets/sidemenu.dart';
import 'package:city_influencers_app/apis/city_api.dart';
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
  List<City> cityList = [];
  int count = 0;
  late Future<Influencer?> influencerData;
  @override
  void initState() {
    super.initState();
   // _getinfluencer();
    _getcities();

    influencerData = InfluencerApi().getInfluencer();


  }
 
  void _getcities() {
    CityApi.fetchCities().then((result) {
      setState(() {
        cityList = result;
        count = result.length;
      });
    });
  }

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
              child: FutureBuilder<Influencer?> (
                future: influencerData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!.gebruikersnaam.toString(),
                      style: TextStyle(
                          fontSize: 36, fontWeight: FontWeight.bold, color: color1),
                      );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  print(snapshot.data);
                  return const CircularProgressIndicator();
                }
              )
              
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
          
          _userListItems()
          ]
          ),

          const Align(
            
            alignment: Alignment.bottomCenter,
            
            child: MenuWidget()
          )]
        )
        
        
        );
         
  }
  ListView _userListItems() {
    return ListView.builder(
      itemCount: count,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      
      itemBuilder: (BuildContext context, int position) {
        return  Align(
          alignment:position.isEven ? Alignment.center:Alignment.center,
           child: CampaignWidget(
                  imageurl: 'assets/biefstukFriet.jpg',
                  text: cityList[position].naam,
                  price: 250)
        );
      },
    );
  }
  


}
