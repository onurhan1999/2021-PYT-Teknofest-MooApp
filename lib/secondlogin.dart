import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mooapp/malSahibi/loginPage.dart';
import 'package:mooapp/tacir/tacirLogin.dart';
import 'package:mooapp/veteriner/loginPage.dart';

import "package:mooapp/common.dart";
import 'package:mooapp/pages/add_status.dart';

void anaLogin() async{

  runApp(DemoFlip3DApp());
}

class DemoFlip3DApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'mooapp ',
      color: Color(0xff000000),
      debugShowCheckedModeBanner: false,
      home: mainPage(),
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) =>
          PageRouteBuilder<T>(
              pageBuilder: (BuildContext context, _, __) => builder(context)),
    );
  }
}

// ignore: camel_case_types
class mainPage extends StatefulWidget {
  mainPage({Key key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

// ignore: camel_case_types
class _mainPageState extends State<mainPage> {
  PageController _controller;
  var currentPageValue = 0.0;

  final List<Widget> _pages = [
    OnboardingPage(
      color: Color(0xff95aaa6),
      title: "Veteriner",
      text: "Veterinerler İçin Hasta Hayvan Takip Uygulaması ... ",
      image: AssetImage('assets/images/image1.png'),
    ),
    OnboardingPage(
      color: Color(0xff95aaa6),
      title: "Tacir",
      text: "Online AL - SAT Aracı Ücreti Ödeme !",
      image: AssetImage('assets/images/image2.png'),
    ),
    OnboardingPage(
      color: Color(0xff95aaa6),
      title: "Mal Sahibi",
      text:
      "Hayvanlarınızın Takibini Yapabileceğiniz Mükemmel Bir Uygulama ...",
      image: AssetImage('assets/images/image3.png'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    _controller.addListener(() {
      setState(() {
        currentPageValue = _controller.page;
//        currentPageValue = 0.5;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // BG layer
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffb1b1b1), Color(0xff325236)])),
            child: Align(
              alignment: Alignment(0.0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => vetLogin()));
                    },
                    //padding: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.all(15),
                    child: Text("Veteriner",),
                    color: Color(0xffd9d9d9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tacirLogin()));
                    },
                    //padding: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.all(15),
                    child: Text("Tacir"),
                    color: Color(0xffd9d9d9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginMalSahibi()));
                    },
                    //padding: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.all(15),
                    child: Text("Mal Sahibi"),
                    color: Color(0xffd9d9d9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildCardLayer(),
        ],
      ),
    );
  }

  Widget _buildCardLayer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: PageIndicator(
            count: _pages.length,
            current: currentPageValue.round(),
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, position) {
              final page = Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: _pages[position],
              );

              // From page
              if (position == currentPageValue.floor()) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0015) // perspective
                    ..rotateY(-pi / 16 * (currentPageValue - position)),
                  child: page,
                );
              }
              // To page
              else if (position == currentPageValue.floor() + 1) {
                return Transform(
                  alignment: FractionalOffset.topRight,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0015) // perspective
                    ..rotateY(-pi / 16 * (currentPageValue - position)),
                  child: page,
                );
              }
              // Other page (not in current view)
              else {
                return page;
              }
            },
          ),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {Key key,
        @required this.text,
        @required this.color,
        @required this.title,
        @required this.image})
      : super(key: key);

  final String title;
  final String text;
  final Color color;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title,
            style: TextStyles.sfProDisplayBold.copyWith(fontSize: 48),
          ),
        ),
        SizedBox(
          height: 1,
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _buildCard()),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      // height: 390,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              text,
              style: TextStyles.sfProTextRegular.copyWith(fontSize: 20),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Image(
            height: 190,
            image: image,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key key, this.count, this.current}) : super(key: key);

  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count + (count - 1), (index) {
        // Build spacer on odd indexes
        if (index % 2 == 1) {
          return SizedBox(
            width: 10,
          );
        }
        // Other build indicator items
        if (index / 2 == current) {
          return _buildActive();
        }

        return _buildIInactive();
      }),
    );
  }

  Widget _buildActive() {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: Color(0xab1c3a6a), borderRadius: BorderRadius.circular(4)),
    );
  }

  Widget _buildIInactive() {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: Color(0xffffffff), borderRadius: BorderRadius.circular(4)),
    );
  }
}