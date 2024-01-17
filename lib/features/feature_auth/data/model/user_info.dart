import 'package:floor/floor.dart';

@entity
class UserInfo {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final String family;
  final String phone;
  final String password;

  UserInfo(
      {this.id,
      required this.name,
      required this.family,
      required this.phone,
      required this.password});
}
