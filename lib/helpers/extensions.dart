import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

/// Here you can put all of your custom classes's extensions

extension toWigdet on String {
  Text toTextWidget({TextStyle? style}) => Text(
        this,
        style: style,
      );
  Widget toListTile({Color? color, void Function()? onTap}) => ListTile(
        dense: true,
        title: Text(this),
        tileColor: color,
        onTap: onTap,
      );
}

extension simpleFormat on DateTime {
  String toSimpleFormat() => DateFormat('d MMM yyy', 'fr_FR').format(this);
}
