import 'package:flutter/foundation.dart';

class Transaction {
  final String Id;
  final String Title;
  final String Type;
  final double Amount;
  final DateTime Date;

  Transaction({
    @required this.Id,
    @required this.Title,
    @required this.Type,
    @required this.Amount,
    @required this.Date
  });
}
