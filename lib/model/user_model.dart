class UserModel{
  String age='';
  String email='';
  String userName='';
  String errorMsg='';

  UserModel.empty();

  UserModel({required this.age, required this.email, required this.userName,required this.errorMsg});

  factory UserModel.fromJson(Map<String, dynamic> json,String errorMessage){
    return UserModel(
        errorMsg:errorMessage,
        age: json["age"].toString() ?? '',
        email: json['email']??'',
        userName: json['username']??'');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['email'] = email;
    data['username'] = userName;
    return data;
    }

  @override
  String toString() {
    return 'UserModel{age: $age, email: $email, userName: $userName}';
  }
}