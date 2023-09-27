import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider = StateProvider<TimeOfDay>((ref) => TimeOfDay.now());