import 'package:complexui6/utils/contants.dart';
import 'package:complexui6/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton({Key key,this.text,this.icon,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: width,
      color: COLOR_DARK_BLUE,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      onPressed: () {},
      child: Row(
        children: [
          Icon(icon,color: COLOR_WHITE,),
          addVerticalSpace(10),
          Text(text,style: TextStyle(color: COLOR_WHITE),),

        ],
      ),
    );
  }
}
