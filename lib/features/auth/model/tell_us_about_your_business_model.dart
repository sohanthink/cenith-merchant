class TellUsAboutYourBusinessModel {
  final String businessName;
  final String registrationName;
  final String vatNumber;
  final PhonNumberModel phoneNumber;
  final String address;
  final String streetOrBuildingNumber;
  final String city;
  final String postalCode;

  TellUsAboutYourBusinessModel({
    required this.businessName,
    required this.registrationName,
    required this.vatNumber,
    required this.phoneNumber,
    required this.address,
    required this.streetOrBuildingNumber,
    required this.city,
    required this.postalCode,
  });

  factory TellUsAboutYourBusinessModel.fromJson(Map<String, dynamic> json) {
    return TellUsAboutYourBusinessModel(
      businessName: json['business_name'] ?? '',
      registrationName: json['registration_name'] ?? '',
      vatNumber: json['vat_number'] ?? '',
      phoneNumber: PhonNumberModel.fromJson(json['phone_number']),
      address: json['address'] ?? '',
      streetOrBuildingNumber: json['street_or_building_number'] ?? '',
      city: json['city'] ?? '',
      postalCode: json['postal_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'business_name': businessName,
      'registration_name': registrationName,
      'vat_number': vatNumber,
      'phone_number': phoneNumber.toJson(),
      'address': address,
      'street_or_building_number': streetOrBuildingNumber,
      'city': city,
      'postal_code': postalCode,
    };
  }
}

class PhonNumberModel {
  final String number;
  final String countryCode;
  final String country;

  PhonNumberModel({
    required this.number,
    required this.countryCode,
    required this.country,
  });

  factory PhonNumberModel.fromJson(Map<String, dynamic> json) {
    return PhonNumberModel(
      number: json['phone_number'],
      countryCode: 'country_code',
      country: 'country',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone_number': number,
      'country_code': countryCode,
      'country': country,
    };
  }
}
