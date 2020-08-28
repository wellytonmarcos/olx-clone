import 'package:flutter/material.dart';

import 'PageSection.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            PageSection(),
          ],
        ),
      ),
    );
  }
}
