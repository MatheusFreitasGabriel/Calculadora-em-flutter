import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color cyan = Colors.cyan;
  Color green = Colors.green;
  String textoAppBar = "Calculadora do Freitas";

  final int operation = Random().nextInt(3);
  final int num1 = Random().nextInt(50);
  final int num2 = Random().nextInt(50);

  final List<String> operations = ["+", "-", "x"];
  final List<String> images = [
    "https://conteudo.imguol.com.br/c/entretenimento/2015/02/24/a-fotografia-do-fisico-alemao-albert-einstein-1879-1955-ganhador-do-premio-nobel-de-fisica-em-1922-mostrando-a-lingua-e-classica-1424796082943_450x450.jpg",
    "https://images.newscientist.com/wp-content/uploads/2024/02/28100426/SEI_193556866.jpg?width=900",
    "https://pt.wikipedia.org/wiki/Ficheiro:Portrait_of_Sir_Isaac_Newton,_1689_(brightened).jpg",


  ];

  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int conta() {
    int resultado = 0;
    switch (operation) {
      case 0: // +
        resultado = num1 + num2;
        break;
      case 1: // -
        resultado = num1 - num2;
        break;
      case 2: // x
        resultado = num1 * num2;
        break;
    }
    return resultado;
  }

  void pegaValor() {
    String valor = _controller.text;
    int numDigitado = int.parse(valor);
    setState(() {
      if (numDigitado == conta()) {
        cyan = green;
        textoAppBar = "Conta correta";
      } else {
        cyan = Colors.red;
        textoAppBar = "Conta incorreta";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
            }, icon: Icon(Icons.calculate, color: Colors.white,),)
          ],
          title: Text(
            "${textoAppBar}",
            style: const  TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: cyan,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Calculos matematicos", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            Image.network("${images[operation]}", width: 100, height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${num1}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${operations[operation]}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${num2}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: "Digite o resultado da sua conta",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                pegaValor();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Confirmar resultado", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: cyan,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}