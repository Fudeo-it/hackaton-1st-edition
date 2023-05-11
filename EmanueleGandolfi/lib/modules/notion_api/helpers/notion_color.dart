import 'package:flutter/material.dart';

class NotionColor {
  static Color? parseNotionColor(String notionColor) {
    switch (notionColor) {
      case 'blue': return Colors.blue;
      case 'brown': return Colors.brown;
      case 'gray': return Colors.grey;
      case 'green': return Colors.green;
      case 'orange': return Colors.orange;
      case 'pink': return Colors.pink;
      case 'purple': return Colors.purple;
      case 'red': return Colors.red;
      case 'yellow': return Colors.yellow;
      default: return null;
    }
  }
}