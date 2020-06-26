import 'package:englishessay/constants.dart';
import 'package:englishessay/services/lauchUrl.dart';
import 'package:flutter/material.dart';

class AboutDeveloper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String name;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "About Developer",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("assets/images/sk.JPG"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "I am a undergraduate student of BSc.Hons Computing at Ithari International College. I have a deep interest towards computer science. I want to develop my career as a Software Developer. I am a hard worker and quick learner.",
                      style: kDescriptionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "I would like to thank my teacher Mr. Bidur Bikram Thapa for the support and help during the whole learning process.",
                      style: kDescriptionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Want to collaborate with me !",
                style: kDescriptionTextStyle,
              ),
              Text("Contact/Follow me At: ", style: kDescriptionTextStyle),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap:()async{
                      await  UrlLauncher().launchURL("https://www.facebook.com/aatitkarkee");
                    },
                                      child: Container(
                      child: Image(
                        height: 50,
                        width: 50,
                        image: AssetImage("assets/icons/001-facebook.png"),
                      ),
                    ),
                  ),
                  GestureDetector(
                     onTap: ()async{
                       await UrlLauncher().launchURL("https://www.instagram.com/karkeysuresh/");
                     },
                                      child: Container(
                      child: Image(
                        height: 50,
                        width: 50,
                        image: AssetImage("assets/icons/003-instagram-1.png"),
                      ),
                    ),
                  ),
                  GestureDetector(
                     onTap: ()async{
                       await UrlLauncher().launchURL("mailto:aatitkarki123@gmail.com?subject=Hire%20to%20Work&body=Hey%20i%20want%20to%20collaborate%20with%20you");
                     } ,
                                      child: Container(
                      child: Image(
                        height: 50,
                        width: 50,
                        image: AssetImage("assets/icons/004-gmail.png"),
                      ),
                    ),
                  ),
                  GestureDetector(
                     onTap: ()async{
                       await UrlLauncher().launchURL("http://github.com/Aatitkarki");
                     },
                                      child: Container(
                        child: Image(
                      height: 50,
                      width: 50,
                      image: AssetImage(
                        "assets/icons/005-github-logo.png",
                      ),
                    )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
