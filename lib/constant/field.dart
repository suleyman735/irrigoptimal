import 'package:flutter/material.dart';

class Field {
  late String fieldName;
  late String fieldCountry;
  late double temperature;
  late String irrSystem;
  String nextirrigationTime;
  String cropsName;
  double fieldsLastIrrigAmount;
  double fieldsRecemonedAmount;

  Field(
      this.fieldName,
      this.fieldCountry,
      this.temperature,
      this.irrSystem,
      this.nextirrigationTime,
      this.cropsName,
      this.fieldsLastIrrigAmount,
      this.fieldsRecemonedAmount);
}

class ChartData {
  final DateTime daily;
  final DateTime monthly;

  final double sales;
  ChartData(
    this.daily,
    this.monthly,
    this.sales,
  );
}

class Crops {
  late String cropsName;
  late String cropsCountry;
  late double cropsTemperature;
  late String cropSystem;

  Crops(this.cropsName, this.cropsCountry, this.cropsTemperature,
      this.cropSystem);
}
