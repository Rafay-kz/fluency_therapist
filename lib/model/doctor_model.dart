class DoctorModel {
  String id = '';
  String image = '';
  String age = '';
  String email = '';
  String userName = '';
  String errorMsg = '';
  String fullName = '';
  String speciality = '';
  String bio = '';
  String location = '';


  DoctorModel.empty();

  DoctorModel({
    required this.id,
    required this.image,
    required this.age,
    required this.email,
    required this.userName,
    required this.errorMsg,
    required this.fullName,
    required this.speciality,
    required this.bio,
    required this.location,

  });

  factory DoctorModel.fromJsonForSession(Map<String, dynamic> json, String errorMessage) {
    return DoctorModel(
      id: json["id"] ?? "",
      errorMsg: errorMessage,
      age: json["age"].toString() ?? '',
      email: json['email'] ?? '',
      userName: json['username'] ?? '',
      image: json['image'] ?? '',
      fullName: json["fullName"].toString() ?? '',
      speciality: json["speciality"].toString() ?? '',
      bio: json["bio"].toString() ?? '',
      location: json["location"].toString() ?? '',

    );
  }

  factory DoctorModel.fromJson(Map<String, dynamic> json, String errorMessage, String id) {
    return DoctorModel(
      id: id,
      errorMsg: errorMessage,
      age: json["age"].toString() ?? '',
      email: json['email'] ?? '',
      userName: json['username'] ?? '',
      fullName: json['fullName'] ?? '',
      speciality: json['speciality'] ?? '',
      bio: json['bio'] ?? '',
      location: json['location'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['age'] = age;
    data['email'] = email;
    data['username'] = userName;
    data['fullName'] = fullName;
    data['speciality'] = speciality;
    data['bio'] = bio;
    data['location'] = location;
    return data;
  }

  @override
  String toString() {
    return 'DoctorModel{age: $age, email: $email, userName: $userName, fullName: $fullName, speciality: $speciality, bio: $bio, location: $location,  id: $id, image: $image}';
  }
}
