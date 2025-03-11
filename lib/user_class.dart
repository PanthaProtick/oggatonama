class UserInformation {
  String firstName;
  String lastName;
  String email;
  String nid;
  String phone;
  
  UserInformation({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.nid,
    required this.phone
  });

  factory UserInformation.fromFirestore(Map<String, dynamic> data) {
    return UserInformation(
      firstName: data["firstName"] ?? "Invalid",
      lastName: data["lastName"] ?? "Invalid",
      email: data["email"] ?? "Invalid",
      nid: data["nid"] ?? 0.0,
      phone: data["phone"] ?? 0.0
    );
  }
}