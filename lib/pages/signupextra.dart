import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/pages/login.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpExtra extends StatefulWidget {
  const SignUpExtra({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpExtra();
}

class _SignUpExtra extends State<SignUpExtra> {
  void _navigateToLogIn() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
final nameController = TextEditingController();
 final emailController = TextEditingController();
 final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color color1 = HexColor("#2A929E");
    return Scaffold(
      resizeToAvoidBottomInset: false,

        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/BackgroundSignup.png"),
                    fit: BoxFit.fill)),

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
                              "Where do you live?",
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
                              controller: nameController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Address",
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
                              controller: emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Postcode",
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
                            width: 85.w,
                            child: TextField(
                               obscureText: true,
                              controller: passwordController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "City",
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
                            )),
                            
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
                                  onPressed: () {InfluencerApi().postInfluencer(emailController.text, nameController.text, passwordController.text);_navigateToLogIn();}
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 18.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'SansitaSwashed',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                                onPressed: () {
                                  _navigateToLogIn();
                                },
                                child: const Text('Sign in'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
