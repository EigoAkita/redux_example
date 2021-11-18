import 'package:redux_example/redux/action.dart';
import 'package:redux_example/redux/state.dart';

///前の状態を受け取り新しいものを作るという副作用のない関数になります。（例：Aを入れたら毎回Bが返る）
///要約するとstore.dispatch(AddName(text)),などで受け取ったパラメーターを個々のクラスで処理して、
///新しい状態で返してあげる

AppState appReducer(AppState prevState, action) {
  if (action is AddName) {
    if (action.name.length > 6) {
      return prevState.copyWith(
        name: action.name,
        errorName: '名前は6文字以内です',
      );
    }
    if (action.name.isEmpty) {
      return prevState.copyWith(
        name: action.name,
        errorName: '名前を入力してください',
      );
    }
    if (action.name.length > 0) {
      return prevState.copyWith(
        name: action.name,
        errorName: '',
      );
    }
    return prevState.copyWith(
      name: action.name,
      errorName: '',
    );
  }

  if (action is AddAge) {
    return prevState.copyWith(
      age: action.age,
    );
  }

  if (action is AddSex) {
    return prevState.copyWith(
      sex: action.sex,
    );
  }

  return prevState;
}
