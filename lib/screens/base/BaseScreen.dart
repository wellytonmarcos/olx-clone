import 'package:flutter/material.dart';
import 'package:olx_mobx/screens/home/HomeScreen.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          Container(
            color: Colors.red,
            child: RaisedButton(
              child: Text('Clo'),
              onPressed: () {
                pageController.jumpToPage(1);
              },
            ),
          ),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
          Container(color: Colors.purple),
          Container(color: Colors.blue),
        ],
      ),
    );
  }
}
