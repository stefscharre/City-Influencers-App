import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:city_influencers_app/pages/home.dart';
import 'package:city_influencers_app/pages/login.dart';
import 'package:city_influencers_app/pages/signupextra_adress.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';

class SignUpExtra extends StatefulWidget {
  const SignUpExtra({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpExtra();
}

var items = ['Man', 'Vrouw', 'Andere'];

class _SignUpExtra extends State<SignUpExtra> {
  void _navigateToLogIn() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  void _navigateToExtra() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpExtraAdress()),
    );
  }

  String date = "";
  DateTime selectedDate = DateTime.now();
  final naamController = TextEditingController();
  final voornaamController = TextEditingController();
  final geboortedatumController = TextEditingController();
  final geslachtController = TextEditingController();
  Influencer? influencer;
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
    print("doet het");
    InfluencerApi().getInfluencer().then((result) {
      setState(() {
        influencer = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = HexColor("#2A929E");
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                    image: AssetImage("assets/BackgroundSignup.png"),
                    fit: BoxFit.fitWidth)),
                    child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(7.w),
                      child: Image.asset('assets/logo.png', height: 7.h),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 16.h),
                          child: SizedBox(
                            width: 50.w,
                            child: const Text(
                              "Name",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 46.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'SansitaSwashed',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 9.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: SizedBox(
                            width: 85.w,
                            child: TextField(
                              controller: voornaamController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "First name",
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: color1,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 3.5.h, vertical: 3.h),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                            width: 85.w,
                            child: TextField(
                              controller: naamController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Last name",
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: color1,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 3.5.h, vertical: 3.h),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: color1,
                                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20), // <-- Radius
                                ),
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)),
                            onPressed: () {
                              _selectDate(context);
                            },
                            child: const Text("Choose Date"),
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0,2.w,5.w,0),
                                child: const Text(
                                  'Gender',
                                  style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'SansitaSwashed',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                      controller: geslachtController)),
                              PopupMenuButton<String>(
                                icon: const Icon(Icons.arrow_drop_down),
                                onSelected: (String value) {
                                  geslachtController.text = value;
                                },
                                itemBuilder: (BuildContext context) {
                                  return items.map<PopupMenuItem<String>>(
                                      (String value) {
                                    return PopupMenuItem(
                                        child: Text(value), value: value);
                                  }).toList();
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 18.w),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 32.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'SansitaSwashed',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Padding(
                                padding: EdgeInsets.all(2.w),
                                child: IconButton(
                                    icon: const Icon(Icons.arrow_forward_sharp),
                                    color: Colors.black,
                                    onPressed: () {
                                      _updateInfluencer();
                                      _navigateToExtra();
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))));
  }

  void _updateInfluencer() {
    influencer!.familienaam = naamController.text; // show the user info using the TextEditingController's
    influencer!.voornaam = voornaamController.text;
    influencer!.geslacht = geslachtController.text;

    if (influencer!.familienaam != null) {
      InfluencerApi().updateInfluencer(influencer!);
    } else {
      print("fail");
    }
  }

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (selected != null && selected != selectedDate) {
      print(DateFormat('yyyy-MM-dd hh:mm:ss').format(selected));
      influencer!.geboortedatum =
          DateFormat('yyyy-MM-dd hh:mm:ss').format(selected);
    }
  }
}
