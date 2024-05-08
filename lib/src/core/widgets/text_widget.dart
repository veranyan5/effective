// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextWidget extends StatelessWidget {
  final String text;

  final TextStyle style;

  final TextAlign align;
  final int maxLines;

  const TextWidget({
    super.key,
    required this.text,
    required this.style,
    this.maxLines = 3,
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
