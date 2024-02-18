import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MagicBall(),
      ),
    );
  }
}

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNumber = 1;

  void changeBall() {
    setState(() {
      ballNumber = (ballNumber % 5) + 1; // Assuming there are 5 ball images
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: const Text(
            'Ask me anything',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade400, // Here you set the background color
            ),
            child: TextButton(
              onPressed: () => {changeBall()},
              child: Image.asset(
                'images/ball$ballNumber.png',
                errorBuilder: (context, error, stackTrace) {
                  return Text('Error: $error');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
