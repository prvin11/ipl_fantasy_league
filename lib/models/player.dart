import 'package:flutter/material.dart';

class Player {
  Player({
    required this.name,
    required this.image,
    required this.points,
    required this.isOverseas,
  });

  final Widget image;
  final String name;
  final double points;
  final bool isOverseas;
}
