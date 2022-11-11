import 'package:battleships/view/homepage.dart';
import 'package:battleships/viewmodel/main_menu.dart';
import 'package:flutter/material.dart';

class waitPage extends StatelessWidget {
  const waitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "W8ing for an opponent",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => mainMenu()),
                    ),
                  );
                },
                child: Icon(Icons.close)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => HomePage()),
                  ),
                );
              },
              child: Text("Game Found"),
            ),
          ]),
    );
  }
}
