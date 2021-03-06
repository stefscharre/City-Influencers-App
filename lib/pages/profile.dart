import 'package:city_influencers_app/apis/city_api.dart';
import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/models/city.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:city_influencers_app/pages/signup.dart';
import 'package:city_influencers_app/widgets/bottomMenu.dart';
import 'package:city_influencers_app/widgets/campaign.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:city_influencers_app/widgets/homeBackground.dart';
import 'package:city_influencers_app/widgets/sidemenu.dart';
import 'package:city_influencers_app/apis/city_api.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_public_api/insta_public_api.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter_insta/flutter_insta.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<Profile> {
  Color color1 = HexColor("#34B6C6");
  Color color2 = HexColor("#EBEBEB");

  Color color3 = HexColor("#4C525C");
  final ipa = InstaPublicApi('stefscharre');
  late final info =  ipa.getBasicInfo();
  FlutterInsta flutterInsta =  FlutterInsta();
  String?  followers = " ";
  Influencer? influencer;
  TextEditingController adressController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController stadController = TextEditingController();
  TextEditingController nummerController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String pictureURL = "";

  final cloudinary =
      CloudinaryPublic('dbyo9rarj', 'CI-img-upload', cache: false);

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
          gebruikersnaam: "",
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
          categories: [],
          );
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
        resizeToAvoidBottomInset: true,
        drawer: const NavDrawer(),
        body: Stack(children: [
          SingleChildScrollView(
              child: Column(children: <Widget>[
            Row(children:const <Widget>[
              HomeBackgroundWidget(),
            ]),
            _userDetails(),
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: ElevatedButton(
                child: const Text('Update influencer'),
                style: ElevatedButton.styleFrom(
                    primary: color1,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // <-- Radius
                    ),
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                onPressed: () {
                  _saveInfluencer();
                },
              ),
            ),
          ])),
          const Align(alignment: Alignment.bottomCenter, child: MenuWidget())
        ]));
  }
 
  void _saveInfluencer() {
    print("ctrllll");
    print(pictureURL);
    print(influencer);
    influencer!.adres = adressController.text; // show the user info using the TextEditingController's
    influencer!.postcode = postcodeController.text;
    influencer!.stad = stadController.text;
    influencer!.telefoonnummer = nummerController.text;
    influencer!.emailadres = emailController.text;
    influencer!.profielfoto = pictureURL;
    print(influencer!.profielfoto);

    if (influencer!.adres != null) {
      InfluencerApi().updateInfluencer(influencer!);
    } else {
    }
  }

  _getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    try {
      if (image != null) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
            folder: "Influencers",
            resourceType: CloudinaryResourceType.Image),
        );
        setState(() {
          print("resss");
          print(response.secureUrl);
          pictureURL = response.secureUrl;
          print(pictureURL);

        });

      }
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
    }
  }

  _userDetails() {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;

    adressController.text = influencer!.adres!;
    postcodeController.text = influencer!.postcode!;
    stadController.text = influencer!.stad!;
    nummerController.text = influencer!.telefoonnummer!;
    emailController.text = influencer!.emailadres!;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${influencer?.voornaam} ${influencer?.familienaam}',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: color3)),
                Column(children: <Widget>[
                  Image.asset(
                    'assets/facebook.png',
                    height: 5.h,
                  ),
                  const Text("120",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ]),
                Column(children: <Widget>[
                  Image.asset(
                    'assets/instagram.png',
                    height: 5.h,
                  ),
                   const Text("456",
                      style:TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ]),
                Column(children: <Widget>[
                  Image.asset(
                    'assets/tiktok.png',
                    height: 5.h,
                  ),
                  const Text("120",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ]),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: ElevatedButton(
                      child: const Text('Upload profile picture'),
                      style: ElevatedButton.styleFrom(
                          primary: color1,
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25), // <-- Radius
                          ),
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        _getImageFromGallery();
                      }),
          ),
          SizedBox(
            height: 5.5.h,
            child: TextField(
              controller: adressController,
              style: textStyle,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Adres",
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
                labelText: "Postcode",
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
              controller: stadController,
              style: textStyle,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Stad",
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
              controller: nummerController,
              style: textStyle,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Telefoonnummer",
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
              controller: emailController,
              style: textStyle,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
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
        ],
      ),
    );
  }
}
