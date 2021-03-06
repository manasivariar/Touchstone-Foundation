import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class BedroomCard extends StatelessWidget {
  final icon;
  final title;
  final bool isSelected;

  const BedroomCard({Key? key, this.icon, this.title, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? HexColor("093B7B") : Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              blurRadius: 5,
              spreadRadius: 0.3,
              color: Colors.black26,
            )
          ]
          ),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(icon,
                color: isSelected ? Colors.white : HexColor("093B7B")),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: isSelected ? Colors.white : HexColor("093B7B")),
            ),
          ],
        ),
      ),
    );
  }
}
