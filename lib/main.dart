import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/redux/reducer.dart';
import 'package:redux_example/view/profile_input_view.dart';
import 'package:redux_example/redux/state.dart';
import 'package:redux/redux.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger();

final Store<AppState> store = Store<AppState>(
  appReducer,

  ///state(状態)に初期値を入れてあげる
  initialState: AppState(
    name: '',
    age: 18,
    sex: 0,
    errorName: '',
  ),
);

void main() {
  logger.setLevel(
    Level.ALL,
    includeCallerInfo: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      ///インスタンス化したStore(_store)をコンストラクタに代入してあげて、
      ///これより下の層でstoreを共有できる
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProfileInputView(),
      ),
    );
  }
}
