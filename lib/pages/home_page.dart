import 'package:flutter/material.dart';
import 'package:vertex/pages/deviceslist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _isSearching = false;
  AnimationController _controller;

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
          height: 200,
          width: 200,
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
      child: Text("Scan for Available Devices",
          style: TextStyle(
            color: Color(0xFF0A4F70),
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            height: 1.5,
          )),
    );
  }

  Widget _searchButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            onPressed: () {
              setState(() {
                _isSearching = true;
              });
            },
            child: Icon(
              Icons.zoom_in,
              color: Color(0xFF0A4F70),
              size: 60.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchingButton() {
    return AnimatedBuilder(
      animation:
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildContainer(150 * _controller.value),
            _buildContainer(200 * _controller.value),
            _buildContainer(250 * _controller.value),
            _buildContainer(300 * _controller.value),
            Align(
                child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                  });
                },
                icon: Icon(
                  Icons.bluetooth_searching,
                  size: 44,
                ),
              ),
            )),
          ],
        );
      },
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.withOpacity(1 - _controller.value),
      ),
    );
  }

  Widget _buildMenu() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DevicesList()));
        },
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
      ),
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
            Align(alignment: Alignment.centerLeft, child: _buildMenu()),
            Align(alignment: Alignment(0, -1), child: _showLogo()),
            _actionText(),
            Container(
              height: size.height * 0.5,
              child: !_isSearching ? _searchButton() : _searchingButton(),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
