import 'homepage.dart';
import 'package:flutter/material.dart';
import 'package:battleships/shipsandrotate.dart';

Color bigShipColor = Colors
    .brown; // gemiler yerleştirildikten sonra haritada değiştirecekleri renkler
Color smallShipColor = Colors.yellow;
Color smallShip2Color = Colors.purple;
//
Color mapColor = Colors.blue;
List matrixList = List.generate(10, (i) => List.filled(10, mapColor),
    growable:
        false); // for döngüsüyle oluşturmak yerine List.generate daha mantıklı
//
List<int> dummyList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
List<int> dummyListReverse = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

List<int> oneToTenList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // for döngüsü için

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
                      builder: (context, _, __) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 25,
                          height: 34,
                          color: matrixList[x][y],
                          margin: EdgeInsets.all(3),
                        ),
                      ),
                      onMove: (DragTargetDetails) {
                        // dragTarget objeleri yerleştirmeden haritada gezdirirken nereye yerleşeceğini gösteren kısım

                        if (matrixList[x][y] == bigShipColor) {
                          matrixList[x][y] = bigShipColor;
                        } else if (matrixList[x][y] == smallShipColor) {
                          matrixList[x][y] = smallShipColor;
                        } else if (matrixList[x][y] == smallShip2Color) {
                          matrixList[x][y] = smallShip2Color;
                        } else {
                          if (DragTargetDetails.data == Colors.red[400]) {
                            if (isBigShipRotate == 1) {
                              if (y == 8 ||
                                  y == 9 ||
                                  y == 1 ||
                                  y == 0 ||
                                  matrixList[x][y - 1] == smallShip2Color ||
                                  matrixList[x][y - 1] == smallShipColor ||
                                  matrixList[x][y - 2] == smallShip2Color ||
                                  matrixList[x][y - 2] == smallShipColor ||
                                  matrixList[x][y + 1] == smallShip2Color ||
                                  matrixList[x][y + 1] == smallShipColor ||
                                  matrixList[x][y + 2] == smallShip2Color ||
                                  matrixList[x][y + 2] == smallShipColor) {
                              } else {
                                matrixList[x][y] = Colors.green;
                              }
                            } else {
                              if (x == 8 ||
                                  x == 9 ||
                                  x == 1 ||
                                  x == 0 ||
                                  matrixList[x - 1][y] == smallShip2Color ||
                                  matrixList[x - 1][y] == smallShipColor ||
                                  matrixList[x - 2][y] == smallShip2Color ||
                                  matrixList[x - 2][y] == smallShipColor ||
                                  matrixList[x + 1][y] == smallShip2Color ||
                                  matrixList[x + 1][y] == smallShipColor ||
                                  matrixList[x + 2][y] == smallShip2Color ||
                                  matrixList[x + 2][y] == smallShipColor) {
                              } else {
                                matrixList[x][y] = Colors.green;
                              }
                            }
                          } else if (DragTargetDetails.data ==
                              Colors.red[300]) {
                            if (isSmallShip2Rotate == 1) {
                              if (y == 9 ||
                                  y == 0 ||
                                  matrixList[x][y - 1] == smallShipColor ||
                                  matrixList[x][y - 1] == bigShipColor ||
                                  matrixList[x][y + 1] == smallShipColor ||
                                  matrixList[x][y + 1] == bigShipColor) {
                              } else {
                                matrixList[x][y] = Colors.green;
                              }
                            } else {
                              if (x == 9 ||
                                  x == 0 ||
                                  matrixList[x - 1][y] == smallShipColor ||
                                  matrixList[x - 1][y] == bigShipColor ||
                                  matrixList[x + 1][y] == smallShipColor ||
                                  matrixList[x + 1][y] == bigShipColor) {
                              } else {
                                matrixList[x][y] = Colors.green;
                              }
                            }
                          } else {
                            if (isSmallShipRotate == 1) {
                              if (y == 9 ||
                                  y == 0 ||
                                  matrixList[x][y - 1] == bigShipColor ||
                                  matrixList[x][y - 1] == smallShip2Color ||
                                  matrixList[x][y + 1] == bigShipColor ||
                                  matrixList[x][y + 1] == smallShip2Color) {
                              } else {
                                matrixList[x][y] = Colors.green;
                              }
                            } else {
                              if (x == 9 ||
                                  x == 0 ||
                                  matrixList[x - 1][y] == bigShipColor ||
                                  matrixList[x - 1][y] == smallShip2Color ||
                                  matrixList[x + 1][y] == bigShipColor ||
                                  matrixList[x + 1][y] == smallShip2Color) {
                              } else {
                                matrixList[x][y] = Colors.green;
                              }
                            }
                          }
                        }
                      },
                      onLeave: (data) {
                        if (matrixList[x][y] == bigShipColor) {
                          matrixList[x][y] = bigShipColor;
                        } else if (matrixList[x][y] == smallShipColor) {
                          matrixList[x][y] = smallShipColor;
                        } else if (matrixList[x][y] == smallShip2Color) {
                          matrixList[x][y] = smallShip2Color;
                        } else {
                          if (data == Colors.red[400]) {
                            if (isBigShipRotate == 1) {
                              matrixList[x][y] = mapColor;
                            } else {
                              matrixList[x][y] = mapColor;
                            }
                          } else if (data == Colors.red[300]) {
                            if (isSmallShip2Rotate == 1) {
                              matrixList[x][y] = mapColor;
                            } else {
                              matrixList[x][y] = mapColor;
                            }
                          } else {
                            // smallship arkasında bıraktığı iz
                            if (isSmallShipRotate == 1) {
                              matrixList[x][y] = mapColor;
                            } else {
                              matrixList[x][y] = mapColor;
                            }
                          }
                        }
                      },
                      onAccept: (data) {
                        // dragtarget objeyi bıraktığımızda gerçekleşecek fonksiyonlar
                        setState(() {
                          if (data == Colors.red[400]) {
                            if (isBigShipRotate == 1) {
                              if (y == 8 ||
                                  y == 9 ||
                                  y == 1 ||
                                  y == 0 ||
                                  matrixList[x][y] == smallShip2Color ||
                                  matrixList[x][y] == smallShipColor ||
                                  matrixList[x][y - 1] == smallShip2Color ||
                                  matrixList[x][y - 1] == smallShipColor ||
                                  matrixList[x][y - 2] == smallShip2Color ||
                                  matrixList[x][y - 2] == smallShipColor ||
                                  matrixList[x][y + 1] == smallShip2Color ||
                                  matrixList[x][y + 1] == smallShipColor ||
                                  matrixList[x][y + 2] == smallShip2Color ||
                                  matrixList[x][y + 2] == smallShipColor) {
                              } else {
                                for (int i = 2; i > -3; i--) {
                                  matrixList[x][y - i] = bigShipColor;
                                  dummyListReverse.insert(0, (10 * x) + y - i);
                                }
                              }
                            } else {
                              if (x == 8 ||
                                  x == 9 ||
                                  x == 1 ||
                                  x == 0 ||
                                  matrixList[x][y] == smallShip2Color ||
                                  matrixList[x][y] == smallShipColor ||
                                  matrixList[x - 1][y] == smallShip2Color ||
                                  matrixList[x - 1][y] == smallShipColor ||
                                  matrixList[x + 1][y] == smallShip2Color ||
                                  matrixList[x + 1][y] == smallShipColor ||
                                  matrixList[x - 2][y] == smallShip2Color ||
                                  matrixList[x - 2][y] == smallShipColor ||
                                  matrixList[x + 2][y] == smallShip2Color ||
                                  matrixList[x + 2][y] == smallShipColor) {
                              } else {
                                for (int i = 2; i > -3; i--) {
                                  matrixList[x - i][y] = bigShipColor;
                                  dummyListReverse.insert(
                                      0, (10 * (x - i)) + y);
                                }
                              }
                            }
                          } else if (data == Colors.red[200]) {
                            if (isSmallShipRotate == 1) {
                              if (y == 9 ||
                                  y == 0 ||
                                  matrixList[x][y] == smallShip2Color ||
                                  matrixList[x][y] == bigShipColor ||
                                  matrixList[x][y - 1] == smallShip2Color ||
                                  matrixList[x][y - 1] == bigShipColor ||
                                  matrixList[x][y + 1] == smallShip2Color ||
                                  matrixList[x][y + 1] == bigShipColor) {
                              } else {
                                for (int i = 1; i > -2; i--) {
                                  matrixList[x][y - i] = smallShipColor;
                                  dummyListReverse.insert(0, (10 * x) + y - i);
                                }
                              }
                            } else {
                              if (x == 0 ||
                                  x == 9 ||
                                  matrixList[x][y] == smallShip2Color ||
                                  matrixList[x][y] == bigShipColor ||
                                  matrixList[x - 1][y] == smallShip2Color ||
                                  matrixList[x - 1][y] == bigShipColor ||
                                  matrixList[x + 1][y] == smallShip2Color ||
                                  matrixList[x + 1][y] == bigShipColor) {
                              } else {
                                for (int i = 1; i > -2; i--) {
                                  matrixList[x - i][y] = smallShipColor;
                                  dummyListReverse.insert(
                                      0, (10 * (x - i)) + y);
                                }
                              }
                            }
                          } else if (data == Colors.red[300]) {
                            if (isSmallShip2Rotate == 1) {
                              if (y == 0 ||
                                  y == 9 ||
                                  matrixList[x][y] == bigShipColor ||
                                  matrixList[x][y] == smallShipColor ||
                                  matrixList[x][y + 1] == smallShipColor ||
                                  matrixList[x][y + 1] == bigShipColor ||
                                  matrixList[x][y - 1] == smallShipColor ||
                                  matrixList[x][y - 1] == bigShipColor) {
                              } else {
                                for (int i = 1; i > -2; i--) {
                                  matrixList[x][y - i] = smallShip2Color;
                                  dummyListReverse.insert(0, (10 * x) + y - i);
                                }
                              }
                            } else {
                              if (x == 0 ||
                                  x == 9 ||
                                  matrixList[x][y] == bigShipColor ||
                                  matrixList[x][y] == smallShipColor ||
                                  matrixList[x + 1][y] == smallShipColor ||
                                  matrixList[x + 1][y] == bigShipColor ||
                                  matrixList[x - 1][y] == smallShipColor ||
                                  matrixList[x - 1][y] == bigShipColor) {
                              } else {
                                for (int i = 1; i > -2; i--) {
                                  matrixList[x - i][y] = smallShip2Color;
                                  dummyListReverse.insert(
                                      0, (10 * (x - i)) + y);
                                }
                              }
                            }
                          }

                          for (int i in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) {
                            dummyList[i] = (dummyListReverse[i] ~/ 10 +
                                (dummyListReverse[i] % 10) * 10);
                          }
                          print(dummyList);
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
