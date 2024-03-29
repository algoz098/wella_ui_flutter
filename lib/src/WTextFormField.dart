library w_text_form_field;

import 'package:flutter/material.dart';

class WTextFormField extends StatefulWidget {
  final String text;
  final String name;

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onFieldSubmitted;
  final bool obscureText;
  final textInputAction;
  final TextInputType keyboardType;
  final fillColor;
  final bool filled;
  final borderRadius;
  final borderColor;
  final String hintText;

  final errors;
  
  const WTextFormField({
    Key key,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.errors,
    this.obscureText = false,
    this.text,
    this.textInputAction,
    this.name,
    this.keyboardType,
    this.fillColor: Colors.transparent,
    this.filled: true,
    this.borderRadius: 0,
    this.borderColor: Colors.black,
    this.hintText: '',
  }) : super(key: key);

  @override
  _WTextFormFieldState createState() => new _WTextFormFieldState();
}

class _WTextFormFieldState extends State<WTextFormField> {
  var _internalValue;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: <Widget>[
        TextFormField(
          controller: widget.controller,

          textInputAction: widget.textInputAction,

          focusNode: widget.focusNode,
          
          autovalidate: true,

          validator: (a) { return _getFirstError(); },

          onFieldSubmitted: widget.onFieldSubmitted,
          
          obscureText: widget.obscureText,

          keyboardType: widget.keyboardType,

          decoration: InputDecoration(
            labelText: widget.text,

            fillColor: widget.fillColor,

            filled: widget.filled,

            hintText: widget.hintText,

            enabledBorder: _borderParser(),

            border: _borderParser()
          ),
        ),
      ],
    );
  }

  _borderParser() {
    if (widget.borderRadius > 0) return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),

      borderSide: BorderSide(color: widget.borderColor, width: 1.5),
    );

    return null;
  }

  _onChanged() {
    if (
      widget.name != null && widget.errors.length > 0
      && this._internalValue != widget.controller.text
    ) {
      widget.errors.removeWhere((item) => item['field'] == widget.name);
    }

    this._internalValue = widget.controller.text;
  }

  _getFirstError() {
    if (widget.name == null) return null;

    for (var i = 0; i < widget.errors.length; i++) {
      final error = widget.errors[i];

      if (error['field'] == widget.name) {
        return error['message'][0].toUpperCase() + error['message'].substring(1);
      }
    }

    return null;
  }
}