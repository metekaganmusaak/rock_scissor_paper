import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  var randomNumberHolder = 0.obs;
  var userChoise = "".obs;
  var aiChoise = "".obs;
  var playerScore = 0.obs;
  var aiScore = 0.obs;
  var winner = "".obs;

  int randomNumberGenerator() {
    Random random = Random();
    randomNumberHolder.value = random.nextInt(3);
    return randomNumberHolder.value;
  }

  whoWon(String userChoise, String aiChoise) {
    if (userChoise != aiChoise) {
      if (userChoise == "rock" && aiChoise == "scissor") {
        playerScore.value++;
        return "Player WON!";
      } else if (userChoise == "rock" && aiChoise == "paper") {
        aiScore.value++;
        return "AI WON!";
      } else if (userChoise == "scissor" && aiChoise == "rock") {
        aiScore.value++;
        return "AI WON!";
      } else if (userChoise == "scissor" && aiChoise == "paper") {
        playerScore.value++;
        return "Player WON!";
      } else if (userChoise == "paper" && aiChoise == "rock") {
        playerScore.value++;
        return "Player WON!";
      } else if (userChoise == "paper" && aiChoise == "scissor") {
        aiScore.value++;
        return "AI WON!";
      }
    } else {
      return "DRAW!";
    }
  }


  Future<void> openDialog() async {
    return await Get.defaultDialog(
      title: "How 2 Play",
      content: Text(
        "Tap the bottom icons.\nApperantly AI will make its own move.",
        style: TextStyle(
            color: Colors.blueGrey, fontSize: 18, fontWeight: FontWeight.w300),
      ),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(15),
      titlePadding: EdgeInsets.all(15),
      textConfirm: "Got it!",
      onConfirm: () => Get.back(),
      buttonColor: Colors.blueGrey,
      confirmTextColor: Colors.blueGrey[50],
      titleStyle: TextStyle(
          color: Colors.blueGrey.shade800, fontWeight: FontWeight.w300),
      barrierDismissible: true,
    );
  }

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance!.addPostFrameCallback((duration) async {
      await openDialog();
    });
  }
}
