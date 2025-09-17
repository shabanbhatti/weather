import 'package:flutter/material.dart';

class CustomTextRichWidget extends StatelessWidget {
  const CustomTextRichWidget({super.key, required this.title, required this.value,  this.fontSize=10,});
final String title;
final String value;
final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return  Text.rich(
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              TextSpan(
                                text: '$title: ',

                                style:  TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        value,
                                    style:  TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.normal,

                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
  }
}