import 'package:city_influencers_app/apis/campaign_api.dart';
import 'package:city_influencers_app/apis/city_api.dart';
import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/apis/posts_api.dart';
import 'package:city_influencers_app/models/campaign.dart';
import 'package:city_influencers_app/models/city.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:city_influencers_app/models/post.dart';
import 'package:city_influencers_app/widgets/bottomMenu.dart';
import 'package:city_influencers_app/widgets/campaign.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:city_influencers_app/widgets/homeBackground.dart';
import 'package:city_influencers_app/widgets/sidemenu.dart';
import 'package:city_influencers_app/apis/city_api.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  final Campaign campaign;

  const Post({Key? key, required this.campaign}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostPage();
}

class _PostPage extends State<Post> {
  Color color1 = HexColor("#4C525C");
  Color color2 = HexColor("#EBEBEB");
  TextEditingController descriptionController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController pictureController = TextEditingController();

  late List<String?>? campaignListTitles = [];
  late List<Campaign?>? campaignList = [];

  bool postCreated = false;
  String message = "";

  final cloudinary =
      CloudinaryPublic('dbyo9rarj', 'CI-img-upload', cache: false);

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  _getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    try {
      if (image != null) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
              folder: "Posts", resourceType: CloudinaryResourceType.Image),
        );
        pictureController.text = response.secureUrl;
      }
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
    }
  }

  _createPost() {
    PostData post = PostData();
    post.opdrachtid = widget.campaign.id;
    post.foto = pictureController.text;
    post.beschrijving = descriptionController.text;

    PostsApi().createPosts(post).then((value) {
      setState(() {
        postCreated = true;
        message = value!;
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
            postCreated == true
                ? Center(
                    child: Text(message),
                  )
                : Padding(
                    padding: EdgeInsets.fromLTRB(3.5.w, 3.w, 0, 3.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "New post",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: color1),
                      ),
                    )),
            _post()
          ]),
          const Align(alignment: Alignment.bottomCenter, child: MenuWidget())
        ]));
  }

  _post() {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: ElevatedButton(
                child: const Text('Upload image'),
                style: ElevatedButton.styleFrom(
                    primary: color1,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // <-- Radius
                    ),
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                onPressed: () {
                  _getImageFromGallery();
                }),
          ),
          SizedBox(
            height: 15.h,
            child: TextField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              style: textStyle,
              decoration: InputDecoration(
                labelText: "Description",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            height: 10,
          ),
          ElevatedButton(
              child: const Text("Create post"),
              onPressed: () {
                _createPost();
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(2.w),
                child: Image.asset(
                  'assets/facebook.png',
                  height: 5.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.w),
                child: Image.asset(
                  'assets/instagram.png',
                  height: 5.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.w),
                child: Image.asset(
                  'assets/tiktok.png',
                  height: 5.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
