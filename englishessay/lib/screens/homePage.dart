import 'package:englishessay/components/menuIcon.dart';
import 'package:englishessay/screens/bookmarkScreen.dart';
import 'package:englishessay/screens/essayList.dart';
import 'package:englishessay/screens/grammerScreen.dart';
import 'package:englishessay/screens/quoteScreen.dart';
import 'package:englishessay/services/networkChecker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset("assets/icons/studying.svg",
                    height: size.height * 0.2)),
            Positioned(
                top: 55,
                left: 30,
                child: Text(
                  "HAMRO \n ESSAY",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "What would you\n like to read?",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        var networkConnected =
                            await NetworkChecker().checkConnection(context);
                        if (networkConnected) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EssayList()));
                        }
                      },
                      child: MenuIcon(
                        icon: FontAwesomeIcons.bookOpen,
                        iconTitle: "ESSAYS",
                        iconColor: Color(0xffFF5A00),
                        backgroundColor: Color(0xff3E2B6C),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuoteScreen()));
                      },
                      child: MenuIcon(
                        icon: FontAwesomeIcons.quoteRight,
                        iconTitle: "QUOTES",
                        iconColor: Color(0xff91382B),
                        backgroundColor: Color(0xffCFADDC),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GrammerSection()));
                      },
                      child: MenuIcon(
                        icon: FontAwesomeIcons.book,
                        iconTitle: "GRAMMER",
                        iconColor: Color(0xff91382B),
                        backgroundColor: Color(0xffF5A492),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookmarkScreen()));
                      },
                      child: MenuIcon(
                        icon: FontAwesomeIcons.bookmark,
                        iconTitle: "BOOKMARK",
                        iconColor: Color(0xffE32028),
                        backgroundColor: Color(0xff78D0B6),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
            Positioned(
              bottom: size.height * 0.07,
              child: Container(
                height: size.height * 0.15,
                width: size.width * 0.6,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("ESSAY CONTEST",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Text("Coming Soon...",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff42485c),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
