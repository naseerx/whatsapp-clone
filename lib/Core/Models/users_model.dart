class UserModel {
  late String name;
  late String image;
  late String lastMessage;
  late String time;

  UserModel({
    required this.name,
    required this.image,
    required this.time,
    required this.lastMessage,

  });

  // Json to Dart Object

  factory UserModel.fromJSON(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      image: map['image'],
      lastMessage: map['lastMessage'],
      time: map['time'],
    );
  }
}
