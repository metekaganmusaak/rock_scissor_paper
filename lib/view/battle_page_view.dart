import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rock_scissor_paper/controller/game_controller.dart';

class BattlePageView extends StatelessWidget {
  final GameController controller = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(
                      "Reseting Scores",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 21),
                    ),
                    backgroundColor: Colors.white,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(),
                        Text(
                      "Current scores will be deleted. You can not restore the scores. Do you really want to continue?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                      ],
                    ),
                    titlePadding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 28),
                    actions: [
                      ElevatedButton(
                        onPressed: (){
                          controller.aiScore.value = 0;
                          controller.playerScore.value = 0;
                          Get.back();
                          Get.snackbar("Success", "Scoreboard cleaned successfully.", colorText: Colors.white, backgroundColor: Colors.green);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[400],
                        ),
                        child: Text("Yes", style: TextStyle(color: Colors.white),),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[400],
                        ),
                        child: Text("Cancel", style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.refresh)),
          SizedBox(
            width: 7,
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "PLAYER",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w300),
                          ),
                          Divider(),
                          CircleAvatar(
                            child: Obx(
                              () => Text(
                                controller.playerScore.value.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                            backgroundColor: Colors.orange[200],
                            radius: 37,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "AI",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w300),
                          ),
                          Divider(),
                          CircleAvatar(
                            child: Obx(
                              () => Text(
                                controller.aiScore.value.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                            backgroundColor: Colors.red[200],
                            radius: 37,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Obx(() {
                          if (controller.userChoise.value == "") {
                            return Text(
                              "?",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 48),
                            );
                          } else if (controller.userChoise.value == "paper") {
                            return Image.asset("assets/paper.png");
                          } else if (controller.userChoise.value == "rock") {
                            return Image.asset("assets/rock.png");
                          } else {
                            return Image.asset("assets/scissor.png");
                          }
                        }),
                      ),
                      Text(
                        "vs",
                        style: TextStyle(fontSize: 36),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Obx(() {
                          if (controller.aiChoise.value == "") {
                            return Text(
                              "?",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 48),
                            );
                          } else if (controller.randomNumberHolder.value == 0) {
                            return Image.asset("assets/rock.png");
                          } else if (controller.randomNumberHolder.value == 1) {
                            return Image.asset("assets/scissor.png");
                          } else {
                            return Image.asset("assets/paper.png");
                          }
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.userChoise.value = "paper";
                          int returnedRandomNumber =
                              controller.randomNumberGenerator();
                          debugPrint("$returnedRandomNumber");
                          if (returnedRandomNumber == 0) {
                            controller.winner.value =
                                controller.whoWon("paper", "rock");
                            controller.userChoise.value = "paper";
                            controller.aiChoise.value = "rock";
                            Get.snackbar(
                              "WINNER IS",
                              "${controller.winner.value}",
                              backgroundColor:
                                  controller.winner.value == "Player WON!"
                                      ? Colors.orange[200]
                                      : Colors.red[200],
                            );
                          } else if (returnedRandomNumber == 1) {
                            controller.winner.value =
                                controller.whoWon("paper", "scissor");
                            controller.userChoise.value = "paper";
                            controller.aiChoise.value = "scissor";
                            Get.snackbar(
                              "WINNER IS",
                              "${controller.winner.value}",
                              backgroundColor:
                                  controller.winner.value == "Player WON!"
                                      ? Colors.orange[200]
                                      : Colors.red[200],
                            );
                          } else {
                            controller.winner.value =
                                controller.whoWon("paper", "paper");
                            controller.userChoise.value = "paper";
                            controller.aiChoise.value = "paper";
                            Get.snackbar(
                              "NO WINNER",
                              "${controller.winner.value}",
                              backgroundColor: Colors.grey,
                            );
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            child: Image.asset(
                              "assets/paper.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.userChoise.value = "rock";
                          int returnedRandomNumber =
                              controller.randomNumberGenerator();
                          if (returnedRandomNumber == 0) {
                            controller.winner.value =
                                controller.whoWon("rock", "rock");
                            controller.userChoise.value = "rock";
                            controller.aiChoise.value = "rock";
                            Get.snackbar(
                              "NO WINNER",
                              "DRAW!",
                              backgroundColor: Colors.grey,
                            );
                          } else if (returnedRandomNumber == 1) {
                            controller.winner.value =
                                controller.whoWon("rock", "scissor");
                            controller.userChoise.value = "rock";
                            controller.aiChoise.value = "scissor";
                            Get.snackbar(
                              "WINNER IS",
                              "${controller.winner.value}",
                              backgroundColor:
                                  controller.winner.value == "Player WON!"
                                      ? Colors.orange[200]
                                      : Colors.red[200],
                            );
                          } else {
                            controller.winner.value =
                                controller.whoWon("rock", "paper");
                            controller.userChoise.value = "rock";
                            controller.aiChoise.value = "paper";
                            Get.snackbar(
                              "WINNER IS",
                              "${controller.winner.value}",
                              backgroundColor:
                                  controller.winner.value == "Player WON!"
                                      ? Colors.orange[200]
                                      : Colors.red[200],
                            );
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            child: Image.asset(
                              "assets/rock.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.userChoise.value = "scissor";
                          int returnedRandomNumber =
                              controller.randomNumberGenerator();
                          if (returnedRandomNumber == 0) {
                            controller.winner.value =
                                controller.whoWon("scissor", "rock");
                            controller.userChoise.value = "scissor";
                            controller.aiChoise.value = "rock";
                            Get.snackbar(
                              "WINNER IS",
                              "${controller.winner.value}",
                              backgroundColor:
                                  controller.winner.value == "Player WON!"
                                      ? Colors.orange[200]
                                      : Colors.red[200],
                            );
                          } else if (returnedRandomNumber == 1) {
                            controller.winner.value =
                                controller.whoWon("scissor", "scissor");
                            controller.userChoise.value = "scissor";
                            controller.aiChoise.value = "scissor";
                            Get.snackbar(
                              "NO WINNER",
                              "DRAW!",
                              backgroundColor: Colors.grey,
                            );
                          } else {
                            controller.winner.value =
                                controller.whoWon("scissor", "paper");
                            controller.userChoise.value = "scissor";
                            controller.aiChoise.value = "paper";
                            Get.snackbar(
                              "WINNER IS",
                              "${controller.winner.value}",
                              backgroundColor:
                                  controller.winner.value == "Player WON!"
                                      ? Colors.orange[200]
                                      : Colors.red[200],
                            );
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            child: Image.asset(
                              "assets/scissor.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
