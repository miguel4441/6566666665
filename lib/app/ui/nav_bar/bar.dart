import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yachap/app/utils/resources.dart';

Widget generalBar(BuildContext context) {
  return AppBar(
      centerTitle: true,
      title: SingleChildScrollView(child: Text("Consulta si eres un usuario(a) de Pensión 65",
          style: TextStyle(color: Colors.black, fontSize: 18),
          textAlign: TextAlign.center,
          strutStyle: StrutStyle(height: 1.3)),
      scrollDirection: Axis.horizontal,),
      backgroundColor: Colors.white10,
      leading: Padding(
          padding: EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              Resources.back,
              fit: BoxFit.contain,
            ),
          )));
}

Widget pensionBar(BuildContext context) {
  return AppBar(
      centerTitle: true,
      title: Container(
        margin: EdgeInsets.only(right: 50),
        child: Text("Consulta el pago de tu Pensión 65",
            style: TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
            strutStyle: StrutStyle(height: 1.3),
            maxLines: 2),
      ),
      backgroundColor: Colors.white10,
      leading: Padding(
          padding: EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              Resources.back,
              fit: BoxFit.contain,
            ),
          )));
}

Widget requirementsBar(BuildContext context) {
  return AppBar(
      centerTitle: true,
      title: Text("Requisitos para acceder a Pensión 65",
          style: TextStyle(color: Colors.black, fontSize: 18),
          strutStyle: StrutStyle(height: 1.3)),
      backgroundColor: Colors.white10,
      leading: Padding(
          padding: EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              Resources.back,
              fit: BoxFit.contain,
            ),
          )));
}

Widget questionsBar(BuildContext context) {
  return AppBar(
      centerTitle: true,
      title: Text("Preguntas Frecuentes",
          style: TextStyle(color: Colors.black, fontSize: 18),
          strutStyle: StrutStyle(height: 1.3)),
      backgroundColor: Colors.white10,
      leading: Padding(
          padding: EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              Resources.back,
              fit: BoxFit.contain,
            ),
          )));
}
