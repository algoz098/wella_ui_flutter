library wella_radio_options;

import 'package:flutter/material.dart';

class WRadioOptions extends StatefulWidget {
  final String text;
  final List<Map> options;
  // final String name;

  TextEditingController controller;

  // final errors;
  
  WRadioOptions({
    Key key,
    this.controller,
    this.options,
    // this.errors,
    this.text,
    // this.name,
  }) : super(key: key);

  @override
  _WRadioOptionsState createState() => new _WRadioOptionsState();
}

class _WRadioOptionsState extends State<WRadioOptions> {
  var _internalValue;

  @override
  void initState() {
    _internalValue = widget.controller.text;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),

      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          new Text(
              widget.text,

              style: new TextStyle(
                fontWeight: FontWeight.bold,
              
                fontSize: 18.0,
              ),
          ),

          new Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: _listOptions()
          ) 
        ]
      )
    );
}

_onChanged(value) {
  // print("antes: ${widget.controller}, depois: $value");

  setState(() {
    widget.controller.text = value;
    _internalValue = value;

  });
}

_listOptions() {
  List<Widget> result = [];

  print(widget.options.length);

  for (var i = 0; i < widget.options.length; i++) {
    var item = widget.options[i];

    result.add(
      InkWell(
        onTap: () => _onChanged(item['value']),

        child: Row(
          children: <Widget>[
            Radio(
              value: item['value'],

              groupValue: _internalValue,

              onChanged: _onChanged,
            ),

            Text(
              item['label'],

              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ) 
      )
    );
  }

  return result;
}


  // _getFirstError() {
  //   if (widget.name == null) return null;

  //   for (var i = 0; i < widget.errors.length; i++) {
  //     final error = widget.errors[i];

  //     if (error['field'] == widget.name) {
  //       return error['message'][0].toUpperCase() + error['message'].substring(1);
  //     }
  //   }

  //   return null;
  // }
}