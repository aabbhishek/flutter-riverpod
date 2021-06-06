part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  try {
    return User(
        id: json['id'] as int,
        name: json['name'] as String,
        favoriteColor: json['favoriteColor']);
  } catch (e, stackTrace) {
    print(e);
    print(stackTrace);
    return User(id: 0, favoriteColor: Colors.black, name: "No Data");
  }
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'favoriteColor': instance.favoriteColor
    };
