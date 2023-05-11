import 'package:flutter/material.dart';

class Filtri {
  static List<Filtro> categories = [
    Filtro(
      name: 'Junior',
      icon: Icons.star_border_purple500_outlined,
      categoria: 'seniority',
      selected: false,
    ),
    Filtro(
      name: 'Mid',
      icon: Icons.star_half,
      categoria: 'seniority',
      selected: false,
    ),
    Filtro(
      name: 'Senior',
      icon: Icons.star,
      categoria: 'seniority',
      selected: false,
    ),
    Filtro(
      name: 'Full time',
      icon: Icons.calendar_month,
      categoria: 'contratto',
      selected: false,
    ),
    Filtro(
      name: 'Part time',
      icon: Icons.timer,
      categoria: 'contratto',
      selected: false,
    ),
    Filtro(
      name: 'Full Remote',
      icon: Icons.travel_explore,
      categoria: 'team',
      selected: false,
    ),
    Filtro(
      name: 'Ibrido',
      icon: Icons.business_center_rounded,
      categoria: 'team',
      selected: false,
    ),
    Filtro(
      name: 'In sede',
      icon: Icons.pin_drop,
      categoria: 'team',
      selected: false,
    ),
  ];
}

class Filtro {
  final String name;
  final String categoria;
  final IconData? icon;
  bool selected;

  Filtro({
    required this.name,
    required this.categoria,
    required this.icon,
    this.selected = false,
  });

  @override
  String toString() {
    return 'Filtro(name: $name, categoria: $categoria, icon: $icon, selected: $selected)';
  }
}
