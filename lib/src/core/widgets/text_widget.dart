// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextWidget extends StatelessWidget {
  String text;

  TextStyle style;
  
  TextAlign align;

  TextWidget({
    super.key,
    required this.text,
    required this.style,
    this.align =  TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: align,
    );
    
  }
}
