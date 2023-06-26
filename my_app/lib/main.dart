import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI_Calculator'),
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
  dynamic result;
  dynamic bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 300,
          height: 500,
          decoration: BoxDecoration(
            color: bgColor,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: Colors.lightBlue,
                  blurStyle: BlurStyle.outer)
            ],
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.blue,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BMI',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade50),
                child: TextField(
                  controller: wtController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text('Enter your weight(in kgs)'),
                      prefixIcon: Icon(Icons.line_weight),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade50),
                child: TextField(
                  controller: ftController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text('Enter your height(in feets)'),
                      prefixIcon: Icon(Icons.height),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade50),
                child: TextField(
                  controller: inController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text('Enter your height(in inches)'),
                      prefixIcon: Icon(Icons.height),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = int.parse(wtController.text);
                    var ft = int.parse(ftController.text);
                    var inch = int.parse(inController.text);
                    if (wt != '' && ft != '' && inch != '') {
                      var tInch = (ft * 12) + inch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = wt / (tM * tM);

                      dynamic msg;

                      if (bmi > 25) {
                        msg = "You are overweight :(";
                        bgColor = Colors.orange.shade200;
                      } else if (bmi < 18) {
                        msg = "You are underWeight :(";
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = "You are healthy :)";
                        bgColor = Colors.green.shade200;
                      }
                      setState(() {
                        result = "$msg \nYour BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill the required blanks!!";
                      });
                    }
                  },
                  child: const Text("Calculate")),
              const SizedBox(
                height: 30,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 140,
                  minHeight: 40,
                  maxWidth: 180,
                  maxHeight: 70,
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    result,
                    style: const TextStyle(fontSize: 15),
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
