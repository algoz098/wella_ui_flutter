library wella_lib;

import 'package:flutter/material.dart';

class WRaisedButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final bool loading;
  final Function onPressed;
  
  const WRaisedButton({
    Key key,
    this.text,
    this.loading,
    this.backgroundColor,
    this.onPressed
  }) : super(key: key);


  @override
  _WRaisedButtonState createState() => new _WRaisedButtonState();
}

class _WRaisedButtonState extends State<WRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0)
      ),

      color: widget.backgroundColor,

      onPressed: widget.onPressed,

      child: setUpButtonChild()
    );
  }

  Widget setUpButtonChild() {
    if (widget.loading == true) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else  {
      return new Text(
        widget.text,

        style: TextStyle(
          fontSize: 20,

          fontWeight: FontWeight.w300,

          color: Colors.white,

          letterSpacing: 3.0
        )
      );
    } 
  }

}