import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class CardView extends StatelessWidget {
  final String text;
  final Function press;
  final IconData icons;
  final Color color, textColor;

  const CardView(
      {Key key,
      this.text,
      this.press,
      this.color,
      this.textColor = Colors.red,
      this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: 60.0,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: color,
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Icon(icons,
                color: Colors.deepOrange[200],),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  text,
                  style: TextStyle(color: textColor),
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.arrow_forward_ios_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
