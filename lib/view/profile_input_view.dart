import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/redux/action.dart';
import 'package:redux_example/redux/state.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/main.dart';
import 'package:redux_example/view/profile_confirmation_view.dart';

class ProfileInputView extends StatelessWidget {
  late final _nameController = TextEditingController(
    text: store.state.name,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'プロフィール入力',
        ),
      ),
      body: GestureDetector(
        onTap: () {
          ///TextFieldのフォーカスを正しく外す方法
          final FocusScopeNode currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreConnector(
                converter: (
                  Store<AppState> store,
                ) {
                  return store.state.name;
                },
                builder: (
                  context,
                  name,
                ) {
                  logger.info('名前-----$name');
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: '名前',
                    ),
                    controller: _nameController,
                    onChanged: (text) {
                      logger.info(
                        store.state.name,
                      );
                      store.dispatch(
                        AddName(text),
                      );
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text!.length > 0 && text.length < 7) return null;
                      return store.state.errorName;
                    },
                  );
                },
              ),
              StoreConnector(
                converter: (
                  Store<AppState> store,
                ) {
                  return store.state.sex;
                },
                builder: (
                  context,
                  sex,
                ) {
                  logger.info(
                    '性別-----${sex == 0 ? '男性' : '女性'}',
                  );
                  return DropdownButtonFormField<int>(
                    items: <int>[
                      0,
                      1,
                    ].map(
                      (int sex) {
                        return DropdownMenuItem<int>(
                          value: sex,
                          child: sex == 0
                              ? Text(
                                  '男性',
                                )
                              : Text(
                                  '女性',
                                ),
                        );
                      },
                    ).toList(),
                    isDense: true,
                    value: store.state.sex,
                    decoration: InputDecoration(
                      labelText: '性別',
                    ),
                    onChanged: (value) {
                      logger.info(value);
                      store.dispatch(
                        AddSex(value!),
                      );
                    },
                  );
                },
              ),
              StoreConnector(
                converter: (Store<AppState> store) {
                  return store.state.age;
                },
                builder: (
                  context,
                  age,
                ) {
                  logger.info(
                    '年齢-----$age',
                  );
                  return DropdownButtonFormField<int>(
                    items: <int>[
                      18,
                      19,
                      20,
                      21,
                      22,
                      23,
                      24,
                      25,
                    ].map((int age) {
                      return DropdownMenuItem<int>(
                        value: age,
                        child: Text(
                          age.toString(),
                        ),
                      );
                    }).toList(),
                    isDense: true,
                    value: store.state.age,
                    decoration: InputDecoration(
                      labelText: '年齢',
                    ),
                    onChanged: (value) {
                      logger.info(value);
                      store.dispatch(
                        AddAge(value!),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        store.state.errorName!.isNotEmpty
                            ? Colors.grey
                            : Colors.blue,
                      ),
                    ),
                    child: const Text(
                      '登録',
                    ),
                    onPressed: () {
                      if (store.state.errorName!.isEmpty)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileConfirmationView(),
                          ),
                        );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
