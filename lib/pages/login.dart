import 'package:city_influencers_app/pages/home.dart';
import 'package:city_influencers_app/pages/signup.dart';
import 'package:city_influencers_app/widgets/circle.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  
@override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<Login> {
 Color color1 = HexColor("#E4E4E4");
 Color color2 = HexColor("#34B6C6");
  void _navigateToSignUp() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
    
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
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/logo.png', height: 50),
          ),
          ],
        ),
            Container(
              

              
      alignment: Alignment.center,
            
      child: Padding(
            padding: const EdgeInsets.only(top: 50),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                const Padding(
                  padding: EdgeInsets.only(right: 60),
                  child: SizedBox(
                    width: 250,
                    child: Text(
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
                const SizedBox(height: 160),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: 320,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Your Email",
                        filled: true,
                        fillColor: color1,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 23),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 320,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: color1,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 23),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(right: 80),
                      child: Text(
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
                      padding: const EdgeInsets.only(left: 68),

                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_sharp),
                            color: Colors.black,
                            onPressed: () {_navigateToHome();},
                          ),
                        ),
                      ),
                    
                  ],
                ),
                const SizedBox(height: 115),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
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
                      padding: const EdgeInsets.only(left: 50),
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




