import 'package:flutter/material.dart';

class AppState {
  final String? name;
  final int? age;
  final int? sex;
  final String? errorName;

  AppState({
    @required this.name,
    @required this.age,
    @required this.sex,
    @required this.errorName,
  });

  ///全て一から新しいStateを作るのではなく、今のStateから変更しないものはコピーして、
  ///変更する値だけ変更するという形をとっています。
  ///name ?? this.nameの部分が、
  ///copyWithメソッドに値が渡されなかったものは今の値を使うという実装です。

  AppState copyWith({
    String? name,
    final int? age,
    final int? sex,
    final String? errorName,
  }) {
    return AppState(
      name: name ?? this.name,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      errorName: errorName ?? this.errorName,
    );
  }
}
