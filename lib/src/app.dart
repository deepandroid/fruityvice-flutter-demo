import 'package:flutter/material.dart';

import 'ui/tab_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        resizeToAvoidBottomInset: false,
           backgroundColor: Colors.white24,
           body: TabScreen(),
          ),
    );
  }
}
