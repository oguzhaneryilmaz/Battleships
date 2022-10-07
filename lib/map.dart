import 'package:flutter/material.dart';

List<int> oneRow = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

List<Color> voidColorsList = [];

forFunc() {
  for (int i = 0; i < 10; i++) {
    voidColorsList.add(Colors.blue);
  }
  ;
}

Color colorVoid = Colors.black;

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  @override
  void initState() {
    forFunc();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                for (var i in oneRow)
                  DragTarget<Color>(
                    onAccept: (data) =>
                        setState(() => voidColorsList[i] = data),
                    builder: (context, _, __) => Container(
                      width: 25,
                      height: 34,
                      color: voidColorsList[i],
                      margin: EdgeInsets.symmetric(horizontal: 3.0),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
