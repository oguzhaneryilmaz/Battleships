import 'package:flutter/material.dart';
import 'package:battleships/shipsandrotate.dart';
//

List matrixList =
    List.generate(10, (i) => List.filled(10, Colors.blue), growable: false);

//
List<int> oneToTenList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

List<Color> voidColorsList = [];

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            for (int x in oneToTenList)
              Column(
                children: [
                  for (int y in oneToTenList)
                    DragTarget<Color>(
                      builder: (context, _, __) => Container(
                        width: 25,
                        height: 34,
                        color: matrixList[x][y],
                        margin: EdgeInsets.all(3),
                      ),
                      onAccept: (data) {
                        setState(() {
                          if (data == Colors.red[400]) {
                            for (int i = 2; i > -3; i--) {
                              matrixList[x][y - i] = Colors.brown;
                            }
                          } else if (data == Colors.red[300]) {
                            for (int i = 1; i > -3; i--) {
                              matrixList[x][y - i] = Colors.orange;
                            }
                          } else if (data == Colors.red[200]) {
                            for (int i = 1; i > -2; i--) {
                              matrixList[x][y - i] = Colors.yellow;
                            }
                          }
                        });
                      },
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

//
//
//
//   GEMİLER VE ROTATE FONKSİYONU
//
//
//
