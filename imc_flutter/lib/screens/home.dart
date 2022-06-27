import 'package:imc_flutter/constants/app_constants.dart';
import 'package:imc_flutter/widgets/left_bar.dart';
import 'package:imc_flutter/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0;
  String textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculadora de IMC",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Altura",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: weightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Peso",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double h = double.parse(heightController.text);
                  double w = double.parse(weightController.text);
                  setState(() {
                    bmiResult = w / (h * h);
                    if (bmiResult > 25) {
                      textResult = "Acima do peso";
                    } else if (bmiResult >= 18.5 && bmiResult <= 25) {
                      textResult = "Peso normal";
                    } else {
                      textResult = "Abaixo do peso";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: accentHexColor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      textResult,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: accentHexColor),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 100,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 180),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 80,
              ),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 140),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 60),
            ],
          ),
        ));
  }
}
