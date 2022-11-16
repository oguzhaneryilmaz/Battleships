import 'package:battleships/view/homepage.dart';
import 'package:battleships/wait_page.dart';
import 'package:flutter/material.dart';

class mainMenu extends StatelessWidget {
  const mainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "MAIN MENU PAGE",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Icon(
              Icons.play_arrow_rounded,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
