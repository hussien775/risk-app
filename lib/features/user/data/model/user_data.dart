class UserData {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? city;
  final String? country;
  final String? token;
  final String? otpCode;
  final String? phone;

  UserData(
      {this.id,
       this.firstName,
        this.lastName,
       this.email,
       this.city,
       this.country,
        this.otpCode,
        this.phone,
      this.token});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName:json['last_name'],
      city: json['city'],
      country: json['country'],
      token: json['token'],
      otpCode: json['code'],
      phone: json['phone']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'first_name': firstName,
      'last_name':lastName,
      'email': email,
      'city': city,
      'country': country,
      'code':otpCode,
      'phone':phone
    };

  }
}
