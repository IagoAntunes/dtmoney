import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  String description;
  double price;
  String date;
  String category;
  bool isEntrie;
  TransactionModel({
    required this.description,
    required this.price,
    required this.date,
    required this.category,
    required this.isEntrie,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'price': price,
      'date': date,
      'category': category,
      'isEntrie': isEntrie,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      description: map['description'] as String,
      price: map['price'] as double,
      date: map['date'] as String,
      category: map['category'] as String,
      isEntrie: map['isEntrie'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
