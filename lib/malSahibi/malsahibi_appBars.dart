import 'package:flutter/material.dart';

import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:mooapp/malSahibi/malsahibi_task.dart';
import 'package:mooapp/malsahibi/malsaihibi_util.dart';

Widget fullAppbar(BuildContext context) {
  return AppBar(
    toolbarHeight: 185,
    backgroundColor: Color(0xffb4cda9),
    flexibleSpace: ClipRRect(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
      child: Container(
        // padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'),),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/malsahibitab.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),

  );

  /*
  PreferredSize(
    preferredSize: Size.fromHeight(162.0),
 child: GradientAppBar(
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      title: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hoşgeldin Hasan!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'Hayvan Takip Programınız Kullanıma Hazır ...',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
          child: Image.asset('assets/images/vt.jpg'),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
        ),),
        )
      ],
      elevation: 0,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [CustomColors.GreenDark, CustomColors.GreenLight,CustomColors.BellGrey],
      ),
    ),
  );*/
}

Widget emptyAppbar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(75.0),
    child: GradientAppBar(
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      title: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello Brenda!',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              'Today you have no tasks',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
          child: Image.asset('assets/images/phto.png'),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
        ),
      ],
      elevation: 0,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [CustomColors.HeaderBlueDark, CustomColors.HeaderBlueLight],
      ),
    ),
  );
}

class CircleOne extends CustomPainter {
  Paint _paint;

  CircleOne() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(28.0, 0.0), 99.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleTwo extends CustomPainter {
  Paint _paint;

  CircleTwo() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(-30, 20), 50.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Widget sickAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 1,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MalsahibiAnasayfa()));
      },
    ),
    title: Text('HASTA HAYVANLAR',
        style: TextStyle(
            fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68))),
  );
}

Widget milkAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 1,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MalsahibiAnasayfa()));
      },
    ),
    title: Text('SÜT ALINAN HAYVANLAR',
        style: TextStyle(
            fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68))),
  );
}
Widget saleAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 1,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MalsahibiAnasayfa()));
      },
    ),
    title: Text('SATILIK HAYVANLAR',
        style: TextStyle(
            fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68))),
  );
}
Widget salePageAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 185,
    backgroundColor: Color(0xffb4cda9),
    flexibleSpace: ClipRRect(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
      child: Container(
        // padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'),),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tacirappbar.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );
}

Widget allAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 1,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MalsahibiAnasayfa()));
      },
    ),
    title: Text('TÜM HAYVANLAR',
        style: TextStyle(
            fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68))),
  );
}

Widget vetPageAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 185,
    backgroundColor: Color(0xffb4cda9),
    flexibleSpace: ClipRRect(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
      child: Container(
        // padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'),),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/vetappbar.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );
}
