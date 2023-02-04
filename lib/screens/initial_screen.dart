import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tasks'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 700),
        child: Container(
          color: Colors.blueGrey,
          child: ListView(
            children: const [
              Task('Aprender Flutter', 'assets/images/estudar_flutter.png', 2),
              Task('Andar de bike', 'assets/images/andar_bike.webp', 3),
              Task('Meditar', 'assets/images/meditar.jpeg', 5),
              Task('Jogar', 'assets/images/jogar.jpg', 4),
              Task('Ler', 'assets/images/ler.jpg', 1),
              SizedBox(height: 80,)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
