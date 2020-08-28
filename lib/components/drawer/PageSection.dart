import 'package:flutter/material.dart';

import 'PageTite.dart';

class PageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageTile(
            label: 'Anúncios',
            iconData: Icons.list,
            onTap: () {},
            highlight: true),
        PageTile(
            label: 'Inserir Anúncio',
            iconData: Icons.edit,
            onTap: () {},
            highlight: false),
        PageTile(
            label: 'Chat', iconData: Icons.chat, onTap: () {}, highlight: true),
        PageTile(
            label: 'Favoritos',
            iconData: Icons.favorite,
            onTap: () {},
            highlight: false),
        PageTile(
            label: 'Minha Conta',
            iconData: Icons.person,
            onTap: () {},
            highlight: false),
      ],
    );
  }
}
