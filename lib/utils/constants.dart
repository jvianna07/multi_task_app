import 'package:flutter/material.dart';

class StaticImagesURL<url> {
  final String imcImageURL = "https://media.giphy.com/media/bFhy4WPGXpvpJle7A1/giphy.gif"; 
  final String currencyImageURL = 'https://ps.w.org/x-currency/assets/icon-256x256.gif?rev=3056906';

}

class StaticBtnColors<cor> {
  final Color btnGray =const Color.fromARGB(255, 212, 208, 208);
  final Color btnOrange = const Color.fromARGB(255, 220, 143, 42);
}


class StaticImcColors<cor> {
  final Color imcColorYellow =const Color.fromARGB(255, 232, 229, 39);
  final Color imcColorGreen= const Color.fromARGB(255, 15, 203, 21);
  final Color imcColorRed = const Color.fromARGB(255, 235, 9, 9);
}


// Constants  for Calculator
enum States { q0Initial, q1Final, q2Reject }