import 'dart:math';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int randomNumber = 0;
  String multnumber = 'mult number';
//دالة اجاد الرقم العشوائي
  void generateRandomNumber() {
    final random = Random();
    int number = random.nextInt(100) + 1;

    setState(() {
      randomNumber = number;
    });
  }
//دالة ضرب العدد 
  void multiplyNumber() {
    setState(() {
      if (randomNumber == 0) {
        multnumber = 'mult number';
      } else {
        multnumber = (randomNumber * 10).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          multnumber,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          height: 200,
          child: Card(
            color: const Color.fromARGB(179, 124, 34, 32),
            child: Center(
              child: Scaffold(
                backgroundColor: const Color.fromRGBO(198, 230, 243, 0.651),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        randomNumber.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white70),
                            ),
                            onPressed: multiplyNumber,
                            child: const Text(
                              "mult",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 31, 30, 30)),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white70),
                            ),
                            onPressed: generateRandomNumber,
                            child: const Text("random",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 31, 30, 30))),
                          ),
                        ],
                      )
                    ],
                  ),
                  
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
