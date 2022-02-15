// ignore_for_file: file_names

import 'package:city_influencers_app/models/post.dart';
import 'package:city_influencers_app/pages/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';


class PostWidget extends StatefulWidget {
  final PostData post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostWidget();

}






class _PostWidget extends State<PostWidget>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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
                  child: Container(
                          width: 13.h,
                          height: 13.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    widget.post.foto.toString(),
                                  )),
                              border:
                                  Border.all(color: Colors.white, width: 3.0)),
                        ),
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
                      Text(widget.post.aantallikes.toString())
                    ]),
              ],
            ),
          )),
    );
  }
}
