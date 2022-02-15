import 'package:city_influencers_app/apis/city_api.dart';
import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/apis/posts_api.dart';
import 'package:city_influencers_app/models/city.dart';
import 'package:city_influencers_app/models/influencer.dart';

import 'package:city_influencers_app/models/influencerApiResponse.dart';
import 'package:city_influencers_app/models/post.dart';
import 'package:city_influencers_app/pages/signup.dart';
import 'package:insta_public_api/insta_public_api.dart';
import 'package:city_influencers_app/widgets/bottomMenu.dart';
import 'package:city_influencers_app/widgets/campaign.dart';
import 'package:city_influencers_app/widgets/postWidget.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:city_influencers_app/widgets/homeBackground.dart';
import 'package:city_influencers_app/widgets/sidemenu.dart';
import 'package:city_influencers_app/apis/city_api.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class MyPosts extends StatefulWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPostsPage();
}

class _MyPostsPage extends State<MyPosts> {
  Color color1 = HexColor("#4C525C");
  Color color2 = HexColor("#EBEBEB");
  List<City> cityList = [];
  List<PostData>? postsList = [];
  int count = 0;
  late Future<Influencer?> influencerData;

@override
  void initState() {
    super.initState();
    // _getinfluencer();
    _getPosts();
  }

  void _getPosts() {
    PostsApi().getPosts().then((value) {
      setState(() {
        postsList = value;
        print(postsList);
      });
    
    });
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      
      drawer: const NavDrawer(),
        body: Stack(
          children: [
          Column(
              children: <Widget>[
            Row(children: const <Widget>[
              HomeBackgroundWidget(),
            ]),
            Padding(
              padding: EdgeInsets.fromLTRB(3.5.w,3.w,0,3.w),
               child: Align(
              alignment: Alignment.centerLeft,
              child:Text('My Posts',
                      style: TextStyle(
                          fontSize: 36, fontWeight: FontWeight.bold, color: color1),
                      )
     
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            SizedBox(
                      width: 60.w,
            child: Padding(
              padding:  EdgeInsets.only(left:3.5.w),
              
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
            ),),]),
            SizedBox(
              height: 50.h,
              child: _myPosts()
            )
          
          
          ]
          ),

          const Align(
            
            alignment: Alignment.bottomCenter,
            
            child: MenuWidget()
          )]
        )
        
        
        );
         
  }

   GridView _myPosts() {
    return GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 2,
  shrinkWrap: true,
  // Generate 100 widgets that display their index in the List.
  children: List.generate(postsList!.length, (index) {
    
    return Center(
      child: PostWidget(post: postsList![index]),
    );
  }, growable: true),
);
  
  }
  


}
