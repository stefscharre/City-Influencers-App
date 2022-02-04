import 'package:city_influencers_app/pages/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

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
          height: 25.h,
          width: 48.w,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.only(top: 2.h),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        'assets/biefstukFriet.jpg',
                        width: 40.w,
                      )),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.w, 1.5.w, 1.w, 0),
                        child: Image.asset(
                          'assets/instagram.png',
                          height: 5.h,
                          width: 5.h,
                        ),
                      ),
                      const Icon(Icons.thumb_up_sharp),
                      const Text('150')
                    ]),
              ],
            ),
          )),
    );
  }
}
