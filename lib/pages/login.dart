import 'package:city_influencers_app/apis/influencer_api.dart';
import 'package:city_influencers_app/pages/home.dart';
import 'package:city_influencers_app/pages/signup.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  
@override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<Login> {
 Color color1 = HexColor("#E4E4E4");
 Color color2 = HexColor("#34B6C6");
 final nameController = TextEditingController();
 final passwordController = TextEditingController();
 late var errorMessage = "";
  void _navigateToSignUp() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
    
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void _navigateToHome() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/BackgroundLogin.png"),
                        fit: BoxFit.fill)),

        child: Column(
          
          children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
          Padding(
            padding:  EdgeInsets.all(7.w),
            child: Image.asset('assets/logo.png', height: 7.h),
          ),
          ],
        ),
            Container(
              

              
      alignment: Alignment.center,
            
      child: Padding(
            padding:  EdgeInsets.only(top: 2.h),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                 Padding(
                  padding: EdgeInsets.only(right: 16.h),
                  child:  SizedBox(
                    width: 50.w,
                    child: const Text(
                      "Welcome back",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 46.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'SansitaSwashed',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(height: 5.h, child: Text(errorMessage,style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                      ),),
                
                Padding(
                  padding:  EdgeInsets.only(bottom: 2.h),
                  child:  SizedBox(
                    width: 85.w,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Username",
                        filled: true,
                        fillColor: color1,
                        contentPadding:  EdgeInsets.symmetric(
                            horizontal: 3.5.h, vertical:3.h),
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
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: color1,
                        contentPadding:  EdgeInsets.symmetric(
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
                      padding: EdgeInsets.only(right: 21.w),
                      child:const Text(
                        "Sign In",
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
                      padding:  EdgeInsets.only(left: 20.w),

                        child: Padding(
                          padding:  EdgeInsets.all(2.w),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_sharp),
                            color: Colors.black,
                            onPressed: () {InfluencerApi().postLogin(nameController.text, passwordController.text).then((value) => {
                              if(value.token==""){
                                setState((){
                                  errorMessage="Wrong username or password";
                                })
                              }
                              else{
                                _navigateToHome()
                              }
                            });},
                          ),
                        ),
                      ),
                    
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.only(right: 10.w),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'SansitaSwashed',
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        onPressed: () {_navigateToSignUp();},
                        child: const Text('Sign up'),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 10.w),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'SansitaSwashed',
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        onPressed: () {},
                        child: const Text('Forgot Password'),
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

