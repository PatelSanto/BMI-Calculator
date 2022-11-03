import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'yourBMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.blue.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            widget.title,
          )),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple.shade700),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Weight    [ in kgs ]'),
                      prefixIcon: Icon(Icons.monitor_weight_outlined),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text('Height    [ in Feet ]'),
                      prefixIcon: Icon(Icons.height_sharp),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text('Height    [ in Inch ]'),
                      prefixIcon: Icon(Icons.height_rounded),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt * 12) + iInch;
                          var tCm = tInch * 2.54;
                          var tM = tCm / 100;

                          var bmi = iWt / (tM * tM);
                          var msg = "";
                          if (bmi > 25) {
                            msg = " You are OverWeight!!";
                            bgColor = Colors.orange.shade300;
                          } else if (bmi < 18) {
                            msg = "You are UnderWeight!!";
                            bgColor = Colors.red.shade300;
                          } else {
                            msg = "You are Healthy!!";
                            bgColor = Colors.green.shade300;
                          }
                          setState(() {
                            result =
                                "$msg \nYour BMI is:- ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blanks!!";
                          });
                        }
                      },
                      child: Text('Calculate')),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
