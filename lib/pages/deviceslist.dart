import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vertex/pages/connected.dart';

class DevicesList extends StatefulWidget {
  @override
  _DevicesListState createState() => _DevicesListState();
}

class _DevicesListState extends State<DevicesList>
    with SingleTickerProviderStateMixin {
  bool _isSearching = false;
  AnimationController _controller;
  List devices = [
    "VFX010115",
    "VFX010000",
    "VFX010098",
    "VFX010356",
    "VFX010765"
  ];
  List battery = [52, 50, 51, 59, 47];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      child: Text("Available Devices",
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

  Widget list() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: devices.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    devices[i],
                    style: TextStyle(
                      color: Color(0xFF0A4F70),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: Icon(
                          FontAwesomeIcons.batteryHalf,
                          color: Color(0xFF959595),
                          size: 25.0,
                        ),
                      ),
                      Text(
                        battery[i].toString() + '%',
                        style: TextStyle(
                          color: Color(0xFF959595),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: SizedBox(
                width: 40,
                child: RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  onPressed: () {
                      Navigator.push(
              context, MaterialPageRoute(builder: (context) => Connected(id: devices[i],battery: battery[i],)));
                  },
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Color(0xFF0A4F70),
                    size: 30.0,
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            Container(height: size.height * 0.5, child: list()),
            Container()
          ],
        ),
      ),
    );
  }
}
