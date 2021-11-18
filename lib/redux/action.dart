///処理名の定義をしているだけなので、実際の処理はappReducer(reducer)で行っている
class AddName {
  String name;
  AddName(this.name);
}

class AddAge {
  int age;
  AddAge(this.age);
}

class AddSex {
  int sex;
  AddSex(this.sex);
}
