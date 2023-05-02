// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:dtmoney/core/models/transaction_model.dart';

class AccountModel {
  String id;
  double totalEntries;
  double totalOutputs;
  double totalgross;
  List<TransactionModel> listTransactions;
  AccountModel({
    required this.id,
    required this.totalEntries,
    required this.totalOutputs,
    required this.totalgross,
    required this.listTransactions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'totalEntries': totalEntries,
      'totalOutputs': totalOutputs,
      'totalgross': totalgross,
      'listTransactions': listTransactions.map((x) => x.toMap()).toList(),
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as String,
      totalEntries: map['totalEntries'] as double,
      totalOutputs: map['totalOutputs'] as double,
      totalgross: map['totalgross'] as double,
      listTransactions: List<TransactionModel>.from(
        (map['listTransactions'] as List<dynamic>).map<TransactionModel>(
          (x) => TransactionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
