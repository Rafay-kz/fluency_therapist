class UserModel {
  String id = '';
  bool isProfileSetUp = false;
  String email = '';
  String firstName = '';
  String lastName = '';
  String image = "";
  String errorMsg = '';

  UserModel.empty();

  UserModel(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.errorMsg,
      required this.image,
      required this.id,
      this.isProfileSetUp = false});

  factory UserModel.fromJson(
      Map<String, dynamic> json, String errorMessage, String id) {
    return UserModel(
      id: id,
      isProfileSetUp: json['isProfileSetUp'] ?? false,
      errorMsg: errorMessage,
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      image: json['image'] ?? '',
    );
  }

  factory UserModel.fromJsonForSession(
      Map<String, dynamic> json, String errorMessage) {
    return UserModel(
      id: json["id"] ?? "",
      isProfileSetUp: json['isProfileSetUp'] ?? false,
      errorMsg: errorMessage,
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;
    data['isProfileSetUp'] = isProfileSetUp;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['image'] = image;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'UserModel{ email: $email, firstName: $firstName,lastName: $lastName, image: $image, id: $id,isProfileSetUp:$isProfileSetUp}';
  }
}
