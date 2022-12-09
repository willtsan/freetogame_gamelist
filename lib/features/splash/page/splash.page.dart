import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Freetogame List",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 32,
            ),
          ),
          const Divider(),
          const Text(
            "Um teste técnico por\nWilliam Santos",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const Divider(),
          TextButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/home');
              },
              child: const Text(
                'Entrar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ))
        ],
      ),
    );
  }
}
