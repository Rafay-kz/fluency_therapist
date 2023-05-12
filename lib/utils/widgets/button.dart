import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String text;
  final TextStyle textStyle;
  final BorderSide side;

  Button({
    Key? key,
    required this.onPressed,
    this.side = const BorderSide(width:2, color: Color(0xff7FB2F0), strokeAlign: BorderSide.strokeAlignInside),
    this.color = const Color(0xff7FB2F0),
    required this.text,
    this.textStyle = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        width:  width*0.89,
        height: height*0.075,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Center(
            child: Text(text, style: textStyle),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            side: side,
            backgroundColor:color,
          ),
        ),
      ),
    );
  }
}