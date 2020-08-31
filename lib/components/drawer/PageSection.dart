import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/stores/PageStore.dart';

import 'PageTite.dart';

class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageTile(
            label: 'Anúncios',
            iconData: Icons.list,
            onTap: () {
              pageStore.setPage(0);
            },
            highlight: pageStore.page == 0),
        PageTile(
            label: 'Inserir Anúncio',
            iconData: Icons.edit,
            onTap: () {
              pageStore.setPage(1);
            },
            highlight: pageStore.page == 1),
        PageTile(
            label: 'Chat',
            iconData: Icons.chat,
            onTap: () {
              pageStore.setPage(2);
            },
            highlight: pageStore.page == 2),
        PageTile(
            label: 'Favoritos',
            iconData: Icons.favorite,
            onTap: () {
              pageStore.setPage(3);
            },
            highlight: pageStore.page == 3),
        PageTile(
            label: 'Minha Conta',
            iconData: Icons.person,
            onTap: () {
              pageStore.setPage(4);
            },
            highlight: pageStore.page == 4),
      ],
    );
  }
}
