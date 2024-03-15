import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final bool? isUnderline;
  final TextAlign? textAlign;
  final TextOverflow? textOverFlow;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.isUnderline,
    this.textAlign,
    this.textOverFlow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: fontSize ?? 28,
            fontWeight: fontWeight ?? FontWeight.w100,
            decoration: isUnderline ?? false
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationColor: Colors.black,
            overflow: textOverFlow ?? TextOverflow.ellipsis));
  }
}
