import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.buttonColor,
    this.textColor = Colors.white,
    required this.onPressed,
    required this.textValue,
    this.widthRate = 0.85,
  });
  final Color? buttonColor, textColor;
  final Function()? onPressed;
  final String textValue;
  final double widthRate;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * widthRate,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonColor)),
          onPressed: onPressed,
          child: Text(
            textValue,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }
}
