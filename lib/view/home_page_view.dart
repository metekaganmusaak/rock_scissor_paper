import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rock_scissor_paper/widgets/card.dart' as gradientCard;

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Rock Scissor Paper",
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: gradientCard.Card(
                    height: 100,
                    width: double.infinity,
                    player1: "YOU",
                    player2: "ARTIFICIAL INTELLIGENCE",
                  ),
                  onTap: () {
                    Get.toNamed("/battle_page");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
