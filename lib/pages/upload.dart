import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vertex/style/theme.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  Widget _showLogo() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Container(
          height: 150,
          width: 150,
          color: Colors.transparent,
          child: Hero(
            tag: 'hero',
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
              child: Image.asset(
                'assets/icons/icon.png',
                // width: 50,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ));
  }

  Widget _buildMenu() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/menu.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _actionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Text("Uploading...",
          style: TextStyle(
            color: Color(0xFF0A4F70),
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            height: 1.5,
          )),
    );
  }

  Widget uploading() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        width: 220.0,
        height: 220.0,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(10.0, 10.0),
              blurRadius: 5.0,
            )
          ],
        ),
        child: CircularPercentIndicator(
          radius: 200.0,
          lineWidth: 6.0,
          percent: 0.99,
          // header: Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: new Text(
          //     "Uploading...",
          //     style: kTitleStyle,
          //   ),
          // ),
          center: new Text(
            "17/47 Putts",
            style: kTitleStyle,
          ),
          backgroundColor: Colors.grey,
          progressColor: Color(0xFF0A4F70),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildMenu(), _showLogo(), SizedBox(width: 40)],
            ),
            _actionText(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: uploading(),
            ),
          ],
        ),
      ),
    );
  }
}
