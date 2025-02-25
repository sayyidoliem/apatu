import 'package:hive/hive.dart';

part 'profile.g.dart';

@HiveType(typeId: 0)
class Profile {
  Profile({required this.email, required this.username});

  @HiveField(0)
  String username;

  @HiveField(1)
  String email;
}
