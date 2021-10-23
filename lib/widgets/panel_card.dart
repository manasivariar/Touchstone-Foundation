import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ts_assignment/bedroom.dart';

class PanelCard extends StatelessWidget {
  final title;
  final count;
  final svg;
  const PanelCard({Key? key, this.title, this.count, this.svg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const BedRoom()));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(svg, height: 50),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "$count Lights",
                style: TextStyle(color: HexColor("FFA939")),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 1,
      ),
    );
  }
}
