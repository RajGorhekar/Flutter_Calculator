import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Color background;
  final String text;
  final Function onPress;
  final Icon icon;

  const Btn({ this.background, this.text, this.onPress, this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: RaisedButton(
        elevation: 4,
        child: icon == null ? Text(
          text,
          style: TextStyle(fontSize: 28.0, color: background == Colors.lightBlue[400] ? Colors.white : Colors.black)  ,
        ) : icon,
        onPressed: onPress,
        color: background,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.redAccent,
        shape: CircleBorder(),
      )
    );
  }
}