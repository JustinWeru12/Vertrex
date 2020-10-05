import 'package:flutter/material.dart';
import 'package:vertex/pages/upload.dart';
import 'package:vertex/style/primary_button.dart';
import 'package:vertex/style/theme.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
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

  Widget data() {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/asset4.png',
              ),
              height: 200,
              width: 200,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Looks like there is no data!',
            style: kTitleStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.0),
          Text(
            'If you have some recorded data from a logged in session, then upload your data now.',
            style: kContentStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buttons() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SecondaryButton(
            text: "Upload Data",
            color: Color(0xFF0A4F70),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UploadPage()));
            },
            height: 40,
          ),
          SecondaryButton(
            text: "Go Live",
            color: Colors.blue[400],
            onPressed: () {},
            height: 40,
          ),
        ],
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: data(),
            ),
            buttons()
          ],
        ),
      ),
    );
  }
}
