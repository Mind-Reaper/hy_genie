import 'package:flutter/material.dart';
import 'theme_state.dart';

InputDecoration fieldDecoration = InputDecoration(
  hintText: 'Email',
  hintStyle: TextStyle(color: appTheme),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: appTheme,
      )),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: appTheme,
      )),
  disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: appTheme,
      )),
  isDense: true,
  contentPadding: EdgeInsets.all(12),
);
