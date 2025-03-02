// the name "CustomUser"is to differentiate from the firebase "User";
class CustomUser {
  final String name;
  final String uid;
  final String profilePicture;
  final String phoneNumber;
  final List<String> groupIds;
  final bool isOnline;

  CustomUser({
    required this.name,
    required this.uid,
    required this.profilePicture,
    required this.phoneNumber,
    required this.groupIds,
    required this.isOnline,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'profilePicture': profilePicture,
      'phoneNumber': phoneNumber,
      'groupIds': groupIds,
      'isOnline': isOnline,
    };
  }

  factory CustomUser.fromMap(Map<String, dynamic> map) {
    return CustomUser(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      groupIds: List<String>.from((map['groupIds'] ?? [])),
      isOnline: map['isOnline'] ?? false,
    );
  }
}
