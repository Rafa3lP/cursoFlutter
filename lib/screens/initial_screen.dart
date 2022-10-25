import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool showList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Tarefas"),
      ),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: showList ? 1 : 0,
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/dash.png',
                3),
            Task(
                'Andar de Bike',
                'assets/images/bike.webp',
                2),
            Task(
                'Ler',
                'assets/images/livro.jpg',
                5),
            Task(
                'Meditar',
                'assets/images/meditar.jpeg',
                4),
            Task('Jogar videogame',
                'assets/images/jogar.jpg', 1),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showList = !showList;
          });
        },
        child: showList
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      ),
    );
  }
}
