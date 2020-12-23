import 'package:construction/construction_icons.dart';
import 'package:flutter/material.dart';

class RoadConstruction extends StatefulWidget {
  @override
  _RoadConstructionAppState createState() => _RoadConstructionAppState();
}

class _RoadConstructionAppState extends State<RoadConstruction> {
  //3 text controllers. Only inputs should be length, width & depth
  final lengthController = new TextEditingController();
  final widthController = new TextEditingController();
  final depthController = new TextEditingController();

  //3 input field values
  double lengthInputValue;
  double widthInputValue;
  double depthInputValue;

  double depthToFeet;

  //sqyd cbyd values
  double squareYards = 0.0;
  double cubicYards = 0.0;
  String squareYardsString = '';
  String cubicYardsString = '';

  //Materials used In Estimates
  double excavation = 0.0;
  double pg5828 = 0.0;
  double tackCoat = 0.0;
  double hotBitAsphalt = 0.0;
  double gravelBaseCourse = 0.0;
  String excavationString = '0.0';
  String pg5828String = '0.0';
  String tackCoatString = '0.0';
  String hotBitAsphaltString = '0.0';
  String gravelBaseCourseString = '0.0';

  getNumbers() {
    lengthController.text == ''
        ? lengthInputValue = 0.0
        : lengthInputValue = double.parse(lengthController.text);
    widthController.text == ''
        ? widthInputValue = 0.0
        : widthInputValue = double.parse(widthController.text);
    depthController.text == ''
        ? depthInputValue = 0.0
        : depthInputValue = double.parse(depthController.text);

    depthToFeet = (depthInputValue - 5.5) * (1 / 12);

    squareYards = (lengthInputValue * widthInputValue) / 9;
    cubicYards =
        (lengthInputValue * widthInputValue * (depthInputValue / 12)) / 27;

    excavation = cubicYards;
    depthInputValue > 5.5
        ? gravelBaseCourse =
            ((lengthInputValue * widthInputValue * depthToFeet) / 27) * 1.75
        : gravelBaseCourse = 0;
    hotBitAsphalt = (110 * squareYards * 5.5) / 2000;
    tackCoat = squareYards * .07;
    pg5828 = hotBitAsphalt * .06;

    setState(() {
      squareYardsString = squareYards.toStringAsFixed(2);
      cubicYardsString = cubicYards.toStringAsFixed(2);

      excavationString = excavation.toStringAsFixed(2);
      gravelBaseCourseString = gravelBaseCourse.toStringAsFixed(2);
      hotBitAsphaltString = hotBitAsphalt.toStringAsFixed(2);
      tackCoatString = tackCoat.toStringAsFixed(2);
      pg5828String = pg5828.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Road Construction Estimates"),
      ),
      body: Center(
        child: Column(
          children: [
            //this will contain a row for the three input fields
            Container(
              height: 80.0,
              padding: EdgeInsets.all(10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('L (ft)'),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 20, 15),
                  width: 75,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: lengthController,
                    keyboardType: TextInputType.number,
                    onTap: () => lengthController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: lengthController.value.text.length),
                  ),
                ),
                Text('W (ft)'),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 20, 15),
                  width: 75,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: widthController,
                    keyboardType: TextInputType.number,
                    onTap: () => widthController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: widthController.value.text.length),
                  ),
                ),
                Text('D (in)'),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 20, 15),
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: depthController,
                    keyboardType: TextInputType.number,
                    onTap: () => depthController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: depthController.value.text.length),
                  ),
                ),
              ]),
            ),

            RawMaterialButton(
              fillColor: Colors.blue,
              shape: CircleBorder(),
              child: Icon(
                Construction.shovel,
              ),
              onPressed: getNumbers,
            ),

            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                        'Square Yards: $squareYardsString Cubic Yards: $cubicYardsString'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PG 58-28:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('$pg5828String TON'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Excavation :',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('$excavationString CY'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Gravel Base Course :',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('$gravelBaseCourseString TON'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hot Bit. Asphalt :',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('$hotBitAsphaltString TON'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tack Coat :',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('$tackCoatString GAL'),
                    ],
                  ),
                ],
              ),
            ),
          ], //children
        ),
      ),
    );
  } // build

} // class

/*
  Excavation - CY
  Gravel Base Course - Tons (1.75% * CY)
  Hot Bituminous Asphalt - Tons ( (110 * SqYd * 5.5) / 2000)
  PG 58-28 - Ton (6% HBA)
  Tack Coat - Gal (7% SqYd)
*/
