import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorSerialiser extends JsonConverter<Color, int>{
  const ColorSerialiser();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;
}