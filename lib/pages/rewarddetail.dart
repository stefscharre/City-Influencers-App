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

class RewardDetail extends StatefulWidget {
  const RewardDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RewardDetailPage();
}

class _RewardDetailPage extends State<RewardDetail> {
  Color color1 = HexColor("#4C525C");
  Color color2 = HexColor("#EBEBEB");
  Color color3 = HexColor("#34B6C6");
  
  Influencer? influencer;
  TextEditingController adressController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController stadController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      influencer = Influencer(
          id: "",
            wachtwoord: "",
          voornaam: "",
          familienaam: "",
          geslacht: "",
          gebruikersnaam: "Stef",
          profielfoto: "",
          adres: "",
          postcode: "",
          stad: "",
          geboortedatum: "",
          telefoonnummer: "",
          emailadres: "",
          gebruikersnaaminstagram: "",
          gebruikersnaamfacebook: "",
          gebruikersnaamtiktok: "",
          aantalvolgersinstagram: "",
          aantalvolgersfacebook: "",
          aantalvolgerstiktok: "",
          infoovervolgers: "",
          badge: "",
          aantalpunten: "",
          categories: []);
    });
    _getinfluencer();
  }

  void _getinfluencer() {
    InfluencerApi().getInfluencer().then((result) {
      setState(() {
        influencer = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        body: Stack(children: [
          Column(children: <Widget>[
            Row(children: <Widget>[
              HomeBackgroundWidget(),
            ]),
            Padding(
                padding: EdgeInsets.fromLTRB(3.5.w, 3.w, 0, 3.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reward",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: color1),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Text(
                "A lommel voucher of €250",
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: color1),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(5.w,5.w,0,0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color1),
                    ))),
            Padding(
                padding: EdgeInsets.fromLTRB(5.w,2.w,0,5.w),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "A lommel worth €20 to go shopping",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: color1),
                    ))),
                     ElevatedButton(
            
            child: const Text('Get Reward'),
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
        
          Padding(
            padding:  EdgeInsets.only(top: 5.w),
            child: SizedBox(
            height: 60.w,      
            width: 60.w,

        child: Card(
      shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
       

        
      )),
          ),
          ]),
          const Align(alignment: Alignment.bottomCenter, child: MenuWidget())
        ]));
  }
}
