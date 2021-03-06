import 'package:city_influencers_app/apis/campaign_api.dart';
import 'package:city_influencers_app/apis/city_api.dart';
import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/models/campaign.dart';
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
class MyCampaigns extends StatefulWidget {
  const MyCampaigns({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCampaigns();
}

class _MyCampaigns extends State<MyCampaigns> {
   Color color1 = HexColor("#4C525C");
  Color color2 = HexColor("#EBEBEB");
  late List<Campaign>? campaignList = [];
  List<City> cityList = [];
  int count = 0;
  late Future<Influencer?> influencerData;
  @override
  void initState() {
    super.initState();
    // _getinfluencer();
    _getCampaigns();
  }

  void _getCampaigns() {
    CampaignApi().fetchCampaigns().then((result) {
      setState(() {
        campaignList = result;
        count = campaignList!.length;
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
                      'My Campaigns',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: color1),
                    ))),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              SizedBox(
                width: 60.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 3.5.w),
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
                ),
              ),
            ]),
            SizedBox(height: 50.h, child: count == 0 ? const Text("There are no campains") : _userListItems())
          ]),
          const Align(alignment: Alignment.bottomCenter, child: MenuWidget())
        ]));
  }

  ListView _userListItems() {
    return ListView.builder(
      itemCount: count,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int position) {
        return Align(
            alignment: position.isEven ? Alignment.center : Alignment.center,
            child: CampaignWidget(
                description: campaignList![position].omschrijving ?? "No description",
                imageurl: campaignList![position].foto ?? "no photo",
                text: campaignList![position].titel ?? "No title",
                price: campaignList![position].aantalpuntenwaard ?? "No points",
                campaign: campaignList![position]
                ));
      },
    );
  }
}
