
import 'package:city_influencers_app/apis/city_api.dart';
import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/models/city.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:city_influencers_app/widgets/bottomMenu.dart';
import 'package:city_influencers_app/widgets/campaign.dart';
import 'package:city_influencers_app/widgets/reward_widget.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:city_influencers_app/widgets/homeBackground.dart';
import 'package:city_influencers_app/widgets/sidemenu.dart';
import 'package:city_influencers_app/apis/city_api.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';
class Reward extends StatefulWidget {
  const Reward({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RewardPage();
}

class _RewardPage extends State<Reward> {
  Color color1 = HexColor("#4C525C");
  Color color2 = HexColor("#EBEBEB");
  Influencer? influencer;
  TextEditingController adressController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController stadController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
          influencer= Influencer(id: "", voornaam: "", familienaam: "", geslacht: "", gebruikersnaam: "Stef", profielfoto: "", adres: "", postcode: "", stad: "", geboortedatum: "", telefoonnummer: "", emailadres: "", gebruikersnaaminstagram: "", gebruikersnaamfacebook: "", gebruikersnaamtiktok: "", aantalvolgersinstagram: "", aantalvolgersfacebook: "", aantalvolgerstiktok: "", infoovervolgers: "", badge: "", aantalpunten: "", categories: []);

    });
   _getinfluencer();
  }
  void _getinfluencer(){
      InfluencerApi().getInfluencer().then((result){

          setState(() {
      influencer = result;
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
              child: Text(
                "Rewards" ,
                style: TextStyle(
                    fontSize: 36, fontWeight: FontWeight.bold, color: color1),
              ),
              
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                RewardWidget(),
                RewardWidget(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                RewardWidget(),
                RewardWidget(),
              ],
            )
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
