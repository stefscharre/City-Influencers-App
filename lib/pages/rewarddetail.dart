import 'dart:async';

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
import 'package:qr_flutter/qr_flutter.dart';

import 'dart:ui' as ui;

class RewardDetail extends StatefulWidget {
  const RewardDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RewardDetailPage();
}

class _RewardDetailPage extends State<RewardDetail> {
  Color color1 = HexColor("#4C525C");
  Color color2 = HexColor("#EBEBEB");
  Color color3 = HexColor("#34B6C6");
  bool blur = true;
  String errormessage = "";

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
  }

  void _getinfluencer() {
    InfluencerApi().getInfluencer().then((result) {
      setState(() {
        influencer = result;
      });
    });
  }

  void _processClaim(rewardPoints) {
    var infPoints = int.parse(influencer!.aantalpunten!);
    if (infPoints >= rewardPoints) {
      setState(() {
        errormessage = "";
        var newPoints = (infPoints - rewardPoints) as int;
        influencer!.aantalpunten = newPoints.toString();

        blur = !blur;
      });
    } else {
      claimCheckTimer.cancel();
      setState(() {
        errormessage = "Not enough points to claim this reward!";
        blur = true;
      });
    }
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
                "A voucher of €10",
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: color1),
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
                      "A QRcode of €10 to use in your local city",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: color1),
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: errormessage != ""
                  ? Text(
                      errormessage,
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                    )
                  : const Text(""),
            ),
            ElevatedButton(
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
                _processClaim(250);
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
                            data: 'This QR code has an embedded image as well',
                            version: QrVersions.auto,
                            size: 20,
                            gapless: true,
                          ))
                      : QrImage(
                          data: 'This QR code has an embedded image as well',
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
