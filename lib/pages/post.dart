
import 'package:city_influencers_app/apis/city_api.dart';
import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/models/city.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:city_influencers_app/widgets/bottomMenu.dart';
import 'package:city_influencers_app/widgets/campaign.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:city_influencers_app/widgets/homeBackground.dart';
import 'package:city_influencers_app/widgets/sidemenu.dart';
import 'package:city_influencers_app/apis/city_api.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';
class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostPage();
}

class _PostPage extends State<Post> {
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
                "New post" ,
                style: TextStyle(
                    fontSize: 36, fontWeight: FontWeight.bold, color: color1),
              ),
              
            )),
            _post()
          ]
          
          ),

          const Align(
            
            alignment: Alignment.bottomCenter,
            
            child: MenuWidget()
          )]
        )
        
        
        );
  }
  _post() {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;

    /* adressController.text = influencer!.adres; // show the user info using the TextEditingController's
    postcodeController.text = influencer!.postcode;
    stadController.text = influencer!.stad; */

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[

            
                  Padding(
              padding:  EdgeInsets.fromLTRB(0,3.h,0,3.h),
              child: ElevatedButton(
              
              child: const Text('Upload image'),
                   style: ElevatedButton.styleFrom(
                      primary: color1,
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
              
          SizedBox(
            height: 15.h,
            child: TextField(
              controller: adressController,
               keyboardType: TextInputType.multiline,
                maxLines: 5,
              style: textStyle,
              decoration: InputDecoration(
                labelText: "Description",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          SizedBox(
            height: 5.5.h,
            child: TextField(
              controller: postcodeController,
              style: textStyle,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Task",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
         Row(
           mainAxisAlignment:  MainAxisAlignment.center,
           children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Image.asset(
                      'assets/facebook.png',
                      height: 5.h,
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.all(2.w),
                    child: Image.asset(
                      'assets/instagram.png',
                      height: 5.h,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Image.asset(
                      'assets/tiktok.png',
                      height: 5.h,
                    ),
                  ),
         ],),
          

        
        ],
      ),
    );
  }


}
