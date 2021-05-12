import 'package:flutter/material.dart';

class MarketModel{
  final name;
  final amount;
  bool editSize;
  final currency;
  var image;
bool scaledown ;
  Color color;
  String percentage;
  MarketModel({this.amount, this.currency, this.image, this.name,  this.color = Colors.transparent,
    this.editSize = false, this.scaledown = false, this.percentage });
}
