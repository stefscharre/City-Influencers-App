import 'package:city_influencers_app/pages/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';

class CampaignWidget extends StatelessWidget {
  final String imageurl;
  final String text;
  final int price;

  const CampaignWidget(
      {Key? key,
      required this.imageurl,
      required this.text,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _navigateToDetail(int id) async {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DetailPage()),
      );
    }

    Color color1 = HexColor("#34B6C6");
    Color color2 = HexColor("#B8B8B8");
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: SizedBox(
          height: 18.h,
          width: 95.w,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                    width: 45.w,
                    child: Column(children: <Widget>[
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(2.w, 1.5.w, 1.w, 0),
                          child: Icon(
                            Icons.favorite_outline_outlined,
                            color: color2,
                            size: 8.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(6.w, 3.w, 0, 2.w),
                          child: Text(
                           price.toString() + " points",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: color1),
                          ),
                        ),
                      ]),
                      Padding(
                        padding: EdgeInsets.only(left: 4.5.w),
                        child: SizedBox(
                          width: 25.w,
                          height: 4.h,
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: ElevatedButton(
                          child: const Text('Lees meer'),
                          style: ElevatedButton.styleFrom(
                              primary: color1,
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(25), // <-- Radius
                              ),
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            _navigateToDetail(1);
                          },
                        ),
                      ),
                    ])),
                SizedBox(
                  width: 45.w,
                  child: Column(
                    children: <Widget>[
                      Image.asset(imageurl, fit: BoxFit.cover)
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
