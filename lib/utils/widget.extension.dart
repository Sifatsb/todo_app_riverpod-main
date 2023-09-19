import 'package:flutter/material.dart';

extension WidgetExtension on num {
  Widget get horizontalSpacing => SizedBox(width: toDouble());

  Widget get verticalSpacing => SizedBox(height: toDouble());

  BorderRadius get circularRadius => BorderRadius.circular(toDouble());
}