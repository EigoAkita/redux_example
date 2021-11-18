import 'package:flutter/material.dart';
import 'package:redux_example/main.dart';

class ProfileConfirmationView extends StatelessWidget {
  const ProfileConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _defaultTextTheme = Theme.of(context).textTheme;
    final _titleStyle = _defaultTextTheme.subtitle1?.copyWith(
      color: Colors.black,
      fontSize: 30,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'プロフィール確認',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              '名前は${store.state.name}です',
              style: _titleStyle,
            ),
            Text(
              '年齢は${store.state.age}歳です',
              style: _titleStyle,
            ),
            Text(
              '性別は${store.state.sex == 0 ? '男性' : '女性'}です',
              style: _titleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
