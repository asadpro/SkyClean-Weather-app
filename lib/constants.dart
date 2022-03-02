import 'package:flutter/material.dart';

const greyText = TextStyle(
    fontSize: 18.0,
    fontFamily: 'SyneMonoRegular',
    color: Colors.grey,
    fontWeight: FontWeight.w600);

const normalText = TextStyle(
    fontSize: 19.0, fontFamily: 'SyneMonoRegular', fontWeight: FontWeight.w600);

const headingText = TextStyle(fontSize: 32.0, fontFamily: 'SyneMono');
const cityName = TextStyle(fontSize: 28.0, fontFamily: 'SyneMono');
const tempNo = TextStyle(
  fontSize: 62.0,
  fontFamily: 'SyneMono',
);

ButtonStyle getStartButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(
        vertical: 27,
      ),
    ),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(18), right: Radius.circular(18)))));
