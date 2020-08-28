import 'package:flutter/material.dart';
import 'package:olx_mobx/components/drawer/CustomDrawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(),
    );
  }
}
