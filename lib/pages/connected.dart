import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vertex/pages/datapage.dart';
import 'package:vertex/style/primary_button.dart';

class Connected extends StatefulWidget {
  final int battery;
  final String id;

  const Connected({Key key, this.battery, this.id}) : super(key: key);
  @override
  _ConnectedState createState() => _ConnectedState();
}

class _ConnectedState extends State<Connected> {
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

  Widget _actionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Text("Connected",
          style: TextStyle(
            color: Color(0xFF0A4F70),
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            height: 1.5,
          )),
    );
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

  Widget deviceinfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.id,
            style: TextStyle(
              color: Color(0xFF0A4F70),
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  FontAwesomeIcons.batteryHalf,
                  color: Color(0xFF959595),
                  size: 30.0,
                ),
              ),
              Text(
                widget.battery.toString() + '%',
                style: TextStyle(
                  color: Color(0xFF959595),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
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
            text: "Go To Dashboard",
            color: Color(0xFF0A4F70),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DataPage()));
            },
            height: 40,
          ),
          SecondaryButton(
            text: "Go Live",
            color: Colors.blue[400],
            onPressed: () {},
            height: 40,
          ),
          SecondaryButton(
            text: "Disconnect Device",
            color: Colors.red[400],
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
            _actionText(),
            deviceinfo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            buttons()
          ],
        ),
      ),
    );
  }
}
