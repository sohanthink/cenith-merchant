class TellUsAboutYourSelfModel {
  final String firstName;
  final String lastName;
  final String countryCode;
  final String mobileNumber;
  final String email;
  final String password;
  final String initialCountry;

  TellUsAboutYourSelfModel({
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.mobileNumber,
    required this.email,
    required this.password,
    required this.initialCountry
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'personalPhone': {
        'countryCode': countryCode,
        'number': mobileNumber,
      },
      'email': email,
      'password': password,
      'initial_country':initialCountry
    };
  }

  factory TellUsAboutYourSelfModel.fromJson(Map<String, dynamic> json) {
    final personalPhone = json['personalPhone'] ?? {};

    return TellUsAboutYourSelfModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      countryCode: personalPhone['countryCode'] ?? json['countryCode'] ?? '',
      mobileNumber: personalPhone['number'] ?? json['mobileNumber'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      initialCountry: json['initial_country']??''
    );
  }
}