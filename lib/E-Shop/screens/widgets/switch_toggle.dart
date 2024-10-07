
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
Widget buildSwitchToggle({required void Function(bool) onToggle , state}){

  return FlutterSwitch(
      width: 70.0,
      height: 45.0,
      valueFontSize: 50.0,
      toggleSize: 45.0,
      inactiveIcon: const Icon(CupertinoIcons.sun_max_fill,color: Color(0xFFFFDF5D),),
      activeIcon: const Icon(CupertinoIcons.moon_fill,color: Color(0xFFF8E3A1),),
      inactiveSwitchBorder: Border.all(color: const Color(0xffccc9c9),width: 6,),
      activeSwitchBorder: Border.all(color: Colors.deepPurple,width: 6,),
      activeToggleColor: Colors.deepPurpleAccent,
      inactiveToggleColor: Colors.black,
      inactiveColor: Colors.white,
      activeColor: const Color(0xFF271052),
      value: state,
      borderRadius: 30.0,
      padding: 2.0,
      //showOnOff: true,
      onToggle: onToggle

  );



}