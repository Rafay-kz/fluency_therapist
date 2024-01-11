class DoctorModel {
  String id = '';
  bool isProfileSetUp = false;
  String image = '';
  String age = '';
  String email = '';
  String firstName = '';
  String lastName = '';
  String errorMsg = '';
  String specialization = '';
  String bio = '';
  String location = '';
  String? deviceToken = ''; // Add this field to store the device token

  DoctorModel.empty();

  DoctorModel({
    required this.id,
    required this.image,
    required this.age,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.errorMsg,
    required this.specialization,
    required this.bio,
    required this.location,
    this.isProfileSetUp = false,
    this.deviceToken,
  });

  factory DoctorModel.fromJsonForSession(
      Map<String, dynamic> json, String errorMessage) {
    return DoctorModel(
      id: json["id"] ?? "",
      isProfileSetUp: json['isProfileSetUp'] ?? false,
      errorMsg: errorMessage,
      age: json["age"].toString() ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      image: json['image'] ?? '',
      specialization: json["specialization"].toString() ?? '',
      bio: json["bio"].toString() ?? '',
      location: json["location"].toString() ?? '',
      deviceToken: json['deviceToken'] ?? '', // Add this line
    );
  }

  factory DoctorModel.fromJson(
      Map<String, dynamic> json, String errorMessage, String id) {
    return DoctorModel(
      id: id,
      errorMsg: errorMessage,
      isProfileSetUp: json['isProfileSetUp'] ?? false,
      age: json["age"].toString() ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      specialization: json['specialization'] ?? '',
      bio: json['bio'] ?? '',
      location: json['location'] ?? '',
      image: json['image'] ?? '',
      deviceToken: json['deviceToken'] ?? '', // Add this line
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isProfileSetUp'] = isProfileSetUp;
    data['image'] = image;
    data['age'] = age;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['specialization'] = specialization;
    data['bio'] = bio;
    data['location'] = location;
    data['deviceToken'] = deviceToken; // Add this line
    return data;
  }

  @override
  String toString() {
    return 'DoctorModel{age: $age, email: $email, firstName: $firstName,lastName: $lastName,specialization: $specialization, bio: $bio, location: $location,  id: $id, image: $image,isProfileSetUp:$isProfileSetUp,deviceToken: $deviceToken}';
  }
}
