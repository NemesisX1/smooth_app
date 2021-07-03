import 'package:flutter/material.dart';
import 'package:smooth/helpers/constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.text,
    this.onPressed,
  }) : super(key: key);
  final String? text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          width: 1,
          color: Theme.of(context).accentColor,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(3),
        onTap: this.onPressed,
        highlightColor: Colors.transparent,
        child: Container(
          height: kGlobalButtonHeigth,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            this.text!.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
