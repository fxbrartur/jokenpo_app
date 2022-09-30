import 'package:flutter/material.dart';
import 'dart:math';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {

  var _imageApp = AssetImage("images/default.png");
  var _message = "Choose one:";
  var _result = "";

  void _selectedoption(String choose){

    ;

    var options = ["rock", "paper", "scissors"];
    var number = Random().nextInt(3);
    var appChoice = options[number];
    print("User' choice: " + choose);
    print("App's choice: " + appChoice);


    switch(appChoice){
      case "rock" :
        setState(() {
          _imageApp = AssetImage("images/rock.png");
        });
        break;
      case "paper" :
        setState(() {
          _imageApp = AssetImage("images/paper.png");
        });
        break;
      case "scissors" :
        setState(() {
          _imageApp = AssetImage("images/scissors.png");
        });
        break;
    }

    // when user wins
    if(
        (choose == "rock" && appChoice == "scissors") ||
        (choose == "scissors" && appChoice == "paper") ||
        (choose == "paper" && appChoice == "rock")
    ){
      setState(() {
        _result = "Congrats, you win!";
      });
    // when app wins
    }else if(
        (appChoice == "rock" && choose == "scissors") ||
        (appChoice == "scissors" && choose == "paper") ||
        (appChoice == "paper" && choose == "rock")
    ){
      setState(() {
        _result = "You suck, loser!";
      });
    }else{
      setState(() {
        _result = "It's a draw!";
      });
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Text(
                    "App's choice:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
          ),
          Image(image: _imageApp,),
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _selectedoption("rock"),
                child: Image.asset("images/rock.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _selectedoption("paper"),
                child: Image.asset("images/paper.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _selectedoption("scissors"),
                child: Image.asset("images/scissors.png", height: 100,),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
