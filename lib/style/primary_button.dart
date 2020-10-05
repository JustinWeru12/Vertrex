import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({this.key, this.text, this.height, this.onPressed})
      : super(key: key);
  final Key key;
  final String text;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: RaisedButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Text(text,
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
            color: Color(0xFF0A4F70),
            textColor: Colors.black87,
            onPressed: onPressed),
      ),
    );
  }
}
class SecondaryButton extends StatelessWidget {
  SecondaryButton({this.key, this.text, this.height, this.onPressed,this.color})
      : super(key: key);
  final Key key;
  final String text;
  final double height;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: RaisedButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Text(text,
                style: TextStyle(color: color, fontSize: 20.0)),
            color: Colors.white,
            textColor: Colors.black87,
            onPressed: onPressed),
      ),
    );
  }
}
