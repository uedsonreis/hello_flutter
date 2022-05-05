import 'package:flutter/material.dart';
import 'package:hello_flutter/shared/menu_bottom.dart';
import 'package:hello_flutter/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(title: const Text('Globo Fitness')),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/beach.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white70),
              child: const Text(
                'Commit to be fit, dare to be great with Globo Fitness',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  shadows: [
                    Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.grey)
                  ],
                ),
              )),
        ),
      ),
      bottomNavigationBar: const MenuBottom(),
    );
  }
}
