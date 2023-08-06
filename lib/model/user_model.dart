class UserModel{
  String id='';
  String age='';
  String email='';
  String userName='';
  String image="";
  String errorMsg='';

  UserModel.empty();

  UserModel({required this.age, required this.email, required this.userName,required this.errorMsg,required this.image,required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json,String errorMessage,String id){
    return UserModel(
      id:id,
        errorMsg:errorMessage,
        age: json["age"].toString() ?? '',
        email: json['email']??'',
        userName: json['username']??'',
        image:json['image']??'',
    );

  }

  factory UserModel.fromJsonForSession(Map<String, dynamic> json,String errorMessage){
    return UserModel(
      id:json["id"]??"",
        errorMsg:errorMessage,
        age: json["age"].toString() ?? '',
        email: json['email']??'',
        userName: json['username']??'',
        image:json['image']??'',
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['email'] = email;
    data['username'] = userName;
    data['image'] = image;
    data['id'] = id;
    return data;
    }

  @override
  String toString() {
    return 'UserModel{age: $age, email: $email, userName: $userName, image: $image, id: $id}';
  }
}