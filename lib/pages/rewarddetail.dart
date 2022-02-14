import 'dart:async';

import 'package:city_influencers_app/apis/city_api.dart';
import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/apis/rewards_api.dart';
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
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:localstorage/localstorage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'dart:ui' as ui;

class RewardDetail extends StatefulWidget {
  final String id;
  final String points;
  final String title;
  final String description;
  final String isclaimed;

  const RewardDetail(
      {Key? key,
      required this.id,
      required this.points,
      required this.title,
      required this.description,
      required this.isclaimed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RewardDetailPage();
}

class _RewardDetailPage extends State<RewardDetail> {
  Color color1 = HexColor("#4C525C");
  Color color2 = HexColor("#EBEBEB");
  Color color3 = HexColor("#34B6C6");
  bool blur = true;
  String message = "";
  String token = "";

  final secureStorage = const FlutterSecureStorage();

  Timer claimCheckTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
    print("checking QR code availability");
  });

  Influencer? influencer;
  TextEditingController adressController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController stadController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getToken();
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
          categories: []);
    });
    _getinfluencer();

    if (widget.isclaimed == "t") {
      blur = false;
    } else {
      blur = true;
    }
  }

  void _getinfluencer() {
    InfluencerApi().getInfluencer().then((result) {
      setState(() {
        influencer = result;
      });
    });
  }

  void _processClaim(rewardPoints) {
    var infPoints = int.parse(influencer!.aantalpunten);
    var points = int.parse(rewardPoints);
    if (infPoints >= points) {
      setState(() {
        message = "";
        var newPoints = (infPoints - points);
        influencer!.aantalpunten = newPoints.toString();
        print(widget.id);

        RewardsApi()
            .claimReward(widget.id)
            .then((value) => {message = value.toString()});

        blur = false;
      });
    } else {
      claimCheckTimer.cancel();
      setState(() {
        message = "Not enough points to claim this reward!";
        blur = true;
      });
    }
  }

  void _getToken() async {
      await secureStorage.read(key: 'token').then((value) => {
        if (value != null) {
          setState(() {
            token = value;
          })
        }
        
      }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        body: Stack(children: [
          Column(children: <Widget>[
            Row(children: const <Widget>[
              HomeBackgroundWidget(),
            ]),
            Padding(
                padding: EdgeInsets.fromLTRB(3.5.w, 3.w, 0, 10.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "Reward: ",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: color1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          widget.points.toString() + " points",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: color1),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: color1),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(5.w, 5.w, 0, 0),
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
                padding: EdgeInsets.fromLTRB(5.w, 2.w, 0, 5.w),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.description,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: color1),
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: message != ""
                  ? Text(
                      message,
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                    )
                  : const Text(""),
            ),
            blur == false
                ? const SizedBox()
                : ElevatedButton(
                    child: const Text('Claim Reward'),
                    style: ElevatedButton.styleFrom(
                        primary: color3,
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), // <-- Radius
                        ),
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      _processClaim(widget.points);
                    },
                  ),
            Padding(
              padding: EdgeInsets.only(top: 5.w),
              child: SizedBox(
                  height: 50.w,
                  width: 50.w,
                  child: blur == true
                      ? ImageFiltered(
                          imageFilter:
                              ui.ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                          child: QrImage(
                            data: token + "," + widget.id ,
                            version: QrVersions.auto,
                            size: 20,
                            gapless: true,
                          ))
                      : QrImage(
                          data: token + "," + widget.id,
                          version: QrVersions.auto,
                          size: 20,
                          gapless: true,
                        )),
            ),
          ]),
          const Align(alignment: Alignment.bottomCenter, child: MenuWidget())
        ]));
  }
}
