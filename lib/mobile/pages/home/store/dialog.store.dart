import 'package:mobx/mobx.dart';

part 'dialog.store.g.dart';

class DialogStore = _DialogStore with _$DialogStore;

abstract class _DialogStore with Store {
  @observable
  bool? typeTransaction;

  void setTypeTransaction(bool newTypeTransaction) {
    typeTransaction = newTypeTransaction;
  }
}
