import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

//yMd create a formatter Object to create Date provided by the intl package
final formatter = DateFormat.yMd();
// Dowload flutter pub add uuid to generate Unique ID
const uuid = Uuid();

// allow us to add custom type: predefined allowed values.
// it's like a static data entity
enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  // you can also add method to the Classes
  // getter method
  String get formattedDate {
    // return a string version of the date, human readable version.
    return formatter.format(date);
  }

  // if you expect more than two parameters. use Named Parameter instead. Easier
  // initializer: use colon to define the identifier that is not inside a constructor
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  //double: support decimal
  final double amount;
  final DateTime date;
  final Category category;
}
