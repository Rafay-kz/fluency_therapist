class DoctorModel {
  String age = '';
  String email = '';
  String userName = '';
  String errorMsg = '';
  String fullName = '';
  String speciality = '';
  String bio = '';
  String location = '';
  String availabilityStart = '';
  String availabilityEnd = '';
  bool isDoctor = false;

  DoctorModel.empty();

  DoctorModel({
    required this.age,
    required this.email,
    required this.userName,
    required this.errorMsg,
    required this.fullName,
    required this.speciality,
    required this.bio,
    required this.location,
    required this.availabilityStart,
    required this.availabilityEnd,
    required this.isDoctor,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json, String errorMessage) {
    return DoctorModel(
      errorMsg: errorMessage,
      age: json["age"].toString() ?? '',
      email: json['email'] ?? '',
      userName: json['username'] ?? '',
      fullName: json['fullName'] ?? '',
      speciality: json['speciality'] ?? '',
      bio: json['bio'] ?? '',
      location: json['location'] ?? '',
      availabilityStart: json['availabilityStart'] ?? '',
      availabilityEnd: json['availabilityEnd'] ?? '',
      isDoctor: json['isDoctor'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['email'] = email;
    data['username'] = userName;
    data['fullName'] = fullName;
    data['speciality'] = speciality;
    data['bio'] = bio;
    data['location'] = location;
    data['availabilityStart'] = availabilityStart;
    data['availabilityEnd'] = availabilityEnd;
    data['isDoctor'] = isDoctor;
    return data;
  }

  @override
  String toString() {
    return 'DoctorModel{age: $age, email: $email, userName: $userName, fullName: $fullName, speciality: $speciality, bio: $bio, location: $location, availabilityStart: $availabilityStart, availabilityEnd: $availabilityEnd, isDoctor: $isDoctor}';
  }
}
