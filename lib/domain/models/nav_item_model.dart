import 'package:flutter/material.dart';

class NavItemModel {
  final String name;
  final GlobalKey key;
  bool isSelected;

  NavItemModel({
    required this.name,
    required this.key,
    this.isSelected = false,
  });
}