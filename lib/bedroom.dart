import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:ts_assignment/models/bedroom_card_model.dart';
import 'package:ts_assignment/models/scene_card_model.dart';
import 'package:ts_assignment/widgets/bedroom_card.dart';
import 'package:ts_assignment/widgets/scenes_card.dart';

class BedRoom extends StatefulWidget {
  const BedRoom({Key? key}) : super(key: key);

  @override
  _BedRoomState createState() => _BedRoomState();
}

class _BedRoomState extends State<BedRoom> {
  List<SceneCardModel> scenes = [
    SceneCardModel(color1: HexColor("FF9B9B"), color2: HexColor("FFB992"), title: "Birthday"),
    SceneCardModel(color1: HexColor("AD93EB"), color2: HexColor("D693EB"), title: "Party"),
    SceneCardModel(color1: HexColor("93CBEB"), color2: HexColor("93DCEB"), title: "Relax"),
    SceneCardModel(color1: HexColor("8FDF94"), color2: HexColor("BAEA92"), title: "Fun"),
  ];

  List<BedroomCardModel> lights = [
    BedroomCardModel(
        icon: "assets/surface1.svg", isSelected: false, title: "Main Light"),
    BedroomCardModel(
        icon: "assets/furniture-and-household.svg",
        isSelected: true,
        title: "Desk Lights"),
    BedroomCardModel(
        icon: "assets/bed (1).svg", isSelected: false, title: "Bed Lights"),
  ];

  List<String> bulbColors = [
    "FF9B9B",
    "8FDF94",
    "93CBEB",
    "AD93EB",
    "DE94EB",
    "FFD239"
  ];

  Color bulbColor = HexColor("FFD239");

  changeBulbColor(Color color) {
    setState(() {
      bulbColor = color;
    });
  }

  double _value = 10.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: BottomAppBar(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: SvgPicture.asset("assets/bulb.svg"),
                    margin: const EdgeInsets.only(left: 50),
                  ),
                  SvgPicture.asset("assets/Icon feather-home.svg"),
                  Container(
                    child: SvgPicture.asset("assets/Icon feather-settings.svg"),
                    margin: const EdgeInsets.only(right: 50),
                  ),
                ],
              ),
            )),
        body: Container(
          height: MediaQuery.of(context).size.height,
          // height: double.infinity,
          color: HexColor("#0A4DA2"),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                // const SizedBox(
                //   height: 30,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Bed",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Room",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "4 Lights",
                            style: TextStyle(
                                color: HexColor("FFD239"), fontSize: 30),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 30, bottom: 20),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SvgPicture.asset("assets/light bulb.svg",
                                  color: Colors.black38),
                              Positioned(
                                bottom: 30,
                                child: Opacity(
                                  opacity: _value / 10,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset.zero,
                                              spreadRadius: 7,
                                              blurRadius: 20,
                                              color: bulbColor)
                                        ]),
                                  ),
                                ),
                              ),
                              SvgPicture.asset("assets/light bulb.svg",
                                  color: bulbColor.withOpacity(_value / 10)),
                            ],
                          ),
                          Positioned(
                            bottom: 35,
                            child: SvgPicture.asset(
                              "assets/Group 38.svg",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < lights.length; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                lights.forEach((light) {
                                  if (light.title != lights[i].title) {
                                    light.isSelected = false;
                                  } else {
                                    light.isSelected = true;
                                  }
                                });
                                // lights[i].isSelected = !lights[i].isSelected;
                              });
                            },
                            child: BedroomCard(
                              icon: lights[i].icon,
                              title: lights[i].title,
                              isSelected: lights[i].isSelected,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: HexColor("F6F8FB"),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Intensity",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SvgPicture.asset(
                                        "assets/solution1.svg"),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: SfSliderTheme(
                                      data: SfSliderThemeData(
                                        tickOffset: const Offset(0.0, 10.0),
                                        activeTrackHeight: 2,
                                        inactiveTrackHeight: 2,
                                        trackCornerRadius: 5,
                                        thumbRadius: 9,
                                        thumbColor: Colors.white,
                                        activeTrackColor: HexColor("FFD239"),
                                        inactiveTrackColor: Colors.grey[300],
                                        overlayRadius: 3,
                                      ),
                                      child: SfSlider(
                                        min: 0.0,
                                        max: 10.0,
                                        interval: 2,
                                        showTicks: true,
                                        // activeColor: HexColor("FFD239"),
                                        // inactiveColor: Colors.grey[300],
                                        value: _value,
                                        onChanged: (dynamic newValue) {
                                          setState(() {
                                            _value = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child:
                                        SvgPicture.asset("assets/solution.svg"),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              const Text(
                                "Colors",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  for (int i = 0; i < 6; i++)
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          changeBulbColor(
                                              HexColor(bulbColors[i]));
                                        },
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor:
                                              HexColor(bulbColors[i]),
                                        ),
                                      ),
                                    ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.white),
                                      Icon(Icons.add_rounded)
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Scenes",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: GridView.builder(
                                    // shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 2.5,
                                            mainAxisSpacing: 15,
                                            crossAxisSpacing: 15),
                                    itemCount: 4,
                                    itemBuilder: (context, index) => ScenesCard(
                                          color1: scenes[index].color1!,
                                          color2: scenes[index].color2!,
                                          title: scenes[index].title,
                                        )),
                              ),
                            ]),
                      ),
                    ),
                    Positioned(
                        right: 25,
                        // top: 10,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _value = 0.0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset.zero,
                                      spreadRadius: 0.5,
                                      blurRadius: 10,
                                      color: Colors.black26)
                                ]),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(
                                  "assets/Icon awesome-power-off.svg",
                                  height: 23,
                                )),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
