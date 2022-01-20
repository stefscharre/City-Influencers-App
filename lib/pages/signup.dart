import 'package:city_influencers_app/pages/login.dart';
import 'package:city_influencers_app/widgets/circle.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUp> {
  void _navigateToLogIn() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = HexColor("#2A929E");
    Color background = HexColor("#34B6C6");
    Color color2 = HexColor("#4C525C");
    return Scaffold(
        backgroundColor: background,
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/BackgroundSignUp.png"),
                    fit: BoxFit.fill)),
            child: Column(
              children: <Widget>[
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
                              "Create account",
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
                        const SizedBox(height: 100),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                            width: 320,
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Your Name",
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                ),
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                            width: 320,
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Your Email",
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                ),
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
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: color1,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 23),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            )),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(right: 73),
                              child: Text(
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
                              padding: const EdgeInsets.only(left: 62),

                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_forward_sharp),
                                    color: Colors.white,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            
                          ],
                        ),
                        const SizedBox(height: 170),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 55),
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
