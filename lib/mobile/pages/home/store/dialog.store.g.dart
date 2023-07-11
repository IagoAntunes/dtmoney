// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DialogStore on _DialogStore, Store {
  late final _$typeTransactionAtom =
      Atom(name: '_DialogStore.typeTransaction', context: context);

  @override
  bool? get typeTransaction {
    _$typeTransactionAtom.reportRead();
    return super.typeTransaction;
  }

  @override
  set typeTransaction(bool? value) {
    _$typeTransactionAtom.reportWrite(value, super.typeTransaction, () {
      super.typeTransaction = value;
    });
  }

  @override
  String toString() {
    return '''
typeTransaction: ${typeTransaction}
    ''';
  }
}
