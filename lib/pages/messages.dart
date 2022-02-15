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

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessagePage();
}

class _MessagePage extends State<Messages> {
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
                      'Messages',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: color1),
                    ))),SizedBox(height: 50.h,
            child: ListView.separated(
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(      
                      trailing: const Text(
                        "Hallo",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text(cityList[index].naam));
                }, separatorBuilder: (BuildContext context, int index) { return Divider(); },)),
          ]),
          const Align(alignment: Alignment.bottomCenter, child: MenuWidget())
        ]));
  }
}
