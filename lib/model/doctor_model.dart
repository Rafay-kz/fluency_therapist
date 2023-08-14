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
  String availabilityStart = '';
  String availabilityEnd = '';
  String startDay = ''; // New field: Start day
  String endDay = '';   // New field: End day

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
    required this.availabilityStart,
    required this.availabilityEnd,
    required this.startDay,
    required this.endDay,
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
      availabilityStart: json["availabilityStart"].toString() ?? '',
      availabilityEnd: json["availabilityEnd"].toString() ?? '',
      startDay: '', // Initialize startDay
      endDay: '',   // Initialize endDay
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
      availabilityStart: json['availabilityStart'] ?? '',
      availabilityEnd: json['availabilityEnd'] ?? '',
      startDay: '', // Initialize startDay
      endDay: '',   // Initialize endDay
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
    data['availabilityStart'] = availabilityStart;
    data['availabilityEnd'] = availabilityEnd;
    data['startDay'] = startDay; // Include startDay
    data['endDay'] = endDay;     // Include endDay
    return data;
  }

  @override
  String toString() {
    return 'DoctorModel{age: $age, email: $email, userName: $userName, fullName: $fullName, speciality: $speciality, bio: $bio, location: $location, availabilityStart: $availabilityStart, availabilityEnd: $availabilityEnd, startDay: $startDay, endDay: $endDay, id: $id, image: $image}';
  }
}
