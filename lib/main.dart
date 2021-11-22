import 'dart:ui';
import 'package:flutter/material.dart'; // Pacote que importa todos os componentes do material Flutter

//comando para identar: Ctrl + Shift + F
//Comando criar StatelessWidget: STLES
void main() {
  //primeira função da chamada do Dart
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Centralizar no eixo Y
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Contador de Pessoas',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.fill,
                  height: 200,
                ),
                SizedBox(
                  // Criando Widget invisivel para dar espaçamento
                  height: 30,
                ),
                Text(
                  isFull ? 'Lotado!' : 'Pode entrar!',
                  style: TextStyle(
                    fontSize: 30,
                    color: isFull ? Colors.red : Colors.green.shade900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  // Criando Widget para dar distanciamento
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 100,
                      color: isFull ? Colors.red : Colors.green.shade900,
                    ),
                  ),
                ),

                /* SizedBox( // Criando Widget invisivel para dar espaçamento
                  height: 32,
                ), */

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.green]),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: isEmpty ? null : decrement,
                            style: TextButton.styleFrom(
                              backgroundColor: isEmpty
                                  ? Colors.grey
                                  : Colors.white.withOpacity(0.2),
                              fixedSize: const Size(100, 100),
                              primary: Colors.green.shade800,
                              shape: RoundedRectangleBorder(
                                //side: BorderSide(color: Colors.green, width: 5),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Text(
                              'Saiu',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      // Criando Widget invisivel para dar espaçamento
                      width: 32,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.green]),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: isFull ? null : increment,
                            style: TextButton.styleFrom(
                              backgroundColor: isFull
                                  ? Colors.grey
                                  : Colors.white.withOpacity(0.2),
                              fixedSize: const Size(100, 100),
                              primary: Colors.green.shade800,
                              shape: RoundedRectangleBorder(
                                //side: BorderSide(color: Colors.green, width: 5),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Text(
                              'Entrou',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
