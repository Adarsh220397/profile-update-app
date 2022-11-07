class UserDetails {
  String imagePath;
  String userName;
  String email;
  String mobile;
  String address;
  String userId;

  UserDetails({
    required this.imagePath,
    required this.userName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['imagePath'] = imagePath;
    data['userName'] = userName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['userId'] = userId;
    return data;
  }

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      imagePath:
          json['imageBinary'] == null ? '' : json['imageBinary'] as String,
      userName: json['username'] == null ? '' : json['username'] as String,
      email: json['email'] == null ? '' : json['email'] as String,
      mobile: json['mobile'] == null ? '' : json['mobile'] as String,
      address: json['address'] == null ? '' : json['address'] as String,
      userId: json['user_id'] == null ? '' : json['user_id'] as String,
    );
  }
}
