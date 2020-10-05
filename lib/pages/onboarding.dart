import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vertex/pages/home_page.dart';
import 'package:vertex/style/theme.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: isActive ? 24.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF0A4F70) : Color(0xFF959595),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget _showLogo() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Container(
          height: 120,
          width: 120,
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

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    print(orientation);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _showLogo(),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/asset1.png',
                                ),
                                height: 200,
                                width: 200,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Vertex Golf',
                              style: kTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Welcome to next generation golf.\nThe industry benchmark in both on & off-course putting data.',
                              style: kSubtitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/asset2.png',
                                ),
                                height: 200,
                                width: 200,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Data where you need it!',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Log your on course data, anytime, anywhere, or simply go live and practice.',
                              style: kSubtitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/asset3.png',
                                ),
                                height: 200,
                                width: 200,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Let\'s Go!',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Time to connect your device.\nEnsure the Bluetooth connection on your mobile device is switched on.',
                              style: kSubtitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: _buildPageIndicator(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: _currentPage == _numPages - 1 ? 134 : 60,
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 8.0),
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            onPressed: () {
                              if (_currentPage == _numPages - 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              } else {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _currentPage == _numPages - 1
                                      ? 'CONNECT'
                                      : "",
                                  style: TextStyle(
                                    color: Color(0xFF0A4F70),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Color(0xFF0A4F70),
                                  size: 40.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
