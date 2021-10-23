import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ts_assignment/models/panel_card_model.dart';
import 'package:ts_assignment/widgets/panel_card.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  List<PanelCardModel> panelData = [
    PanelCardModel(title: "Bed room", count: "4", svgPath: "assets/bed.svg"),
    PanelCardModel(
        title: "Living room", count: "2", svgPath: "assets/room.svg"),
    PanelCardModel(title: "Kitchen", count: "5", svgPath: "assets/kitchen.svg"),
    PanelCardModel(
        title: "Bathroom", count: "1", svgPath: "assets/bathtube.svg"),
    PanelCardModel(title: "Outdoor", count: "5", svgPath: "assets/house.svg"),
    PanelCardModel(title: "Balcony", count: "2", svgPath: "assets/balcony.svg"),
  ];

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
            color: HexColor("#0A4DA2"),
            child: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Control\nPanel",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Stack(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                child: Container(
                                  height: 65,
                                  width: 65,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/Manasi_Variar.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            Positioned(
                                top: 3,
                                right: 3,
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: HexColor("FF9898"),
                                ))
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 10),
                      //   child: SvgPicture.asset("assets/user.svg"),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.73,
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
                            "All Rooms",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 15),
                                itemCount: 6,
                                itemBuilder: (context, index) => PanelCard(
                                      svg: panelData[index].svgPath,
                                      count: panelData[index].count,
                                      title: panelData[index].title,
                                    )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
