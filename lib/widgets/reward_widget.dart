import 'package:city_influencers_app/pages/rewarddetail.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';

class RewardWidget extends StatelessWidget {
  final String id;
  final String title;
  final String points;
  final String description;
  final String isclaimed;

  const RewardWidget(
      {Key? key,
      required this.id,
      required this.title,
      required this.points,
      required this.description,
      required this.isclaimed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _navigateToRewardDetail() async {
      await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RewardDetail(
                id: id,
                description: description,
                title: title,
                isclaimed: isclaimed,
                points: points)),
      );
    }

    Color color1 = HexColor("#34B6C6");
    Color color2 = HexColor("#B8B8B8");
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: GestureDetector(
            onTap: () {
              _navigateToRewardDetail();
            },
            child: Padding(
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
                        Center(
                          child: SizedBox(
                              width: 55.w,
                              child: Column(children: <Widget>[
                                isclaimed == "t"
                                    ? Row(children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 4.5.w,
                                                right: 4.5.w,
                                                top: 6.h),
                                            child: SizedBox(
                                                width: 45.w,
                                                height: 4.h,
                                                child: Padding(
                                                  padding: EdgeInsets.only(left: 10.w),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(right: 2.w),
                                                        child: Icon(Icons.check_sharp,
                                                            color: color1,
                                                            size: 20),
                                                      ),
                                                      Text(
                                                        "Claimed",
                                                        style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: color1,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )))
                                      ])
                                    : Row(children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 4.5.w,
                                              right: 4.5.w,
                                              top: 6.h),
                                          child: SizedBox(
                                            width: 45.w,
                                            height: 4.h,
                                            child: Text(
                                              points.toString() + " points",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: color1),
                                            ),
                                          ),
                                        ),
                                      ]),
                                SizedBox(
                                  width: 25.w,
                                  height: 4.h,
                                  child: Text(
                                    title,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])),
                        ),
                        SizedBox(
                          width: 30.w,
                          child: Column(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 25.0),
                                child: Icon(Icons.qr_code_sharp, size: 80),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            )));
  }
}
