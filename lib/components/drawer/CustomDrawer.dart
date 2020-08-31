import 'package:flutter/material.dart';
import 'package:olx_mobx/components/drawer/PageHeader.dart';

import 'PageSection.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              PageHeader(),
              PageSection(),
            ],
          ),
        ),
      ),
    );
  }
}
