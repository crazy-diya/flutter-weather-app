import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    bottomOpacity: 0,
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    title: Row(children: const [
      InkWell(
        child: FaIcon(FontAwesomeIcons.barsStaggered),
      ),
      Spacer(),
      InkWell(
        child: FaIcon(FontAwesomeIcons.ellipsis),
      ),
    ]),
  );
}