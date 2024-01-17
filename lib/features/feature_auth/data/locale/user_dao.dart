import 'package:floor/floor.dart';
import 'package:shop/features/feature_auth/data/model/user_info.dart';

@dao
abstract class UserDao {
  @Query("SELECT * FROM UserInfo")
  Future<List<UserInfo>> findAllUserWithDevice();

  @Query("SELECT * FROM UserInfo WHERE phone = :phone AND password = :password")
  Future<UserInfo?> findUserByPhoneAndPassword(String phone, String password);

  @insert
  Future<void> addUser(UserInfo user);

  @delete
  Future<void> deleteUser(UserInfo user);
  @Query('SELECT * FROM UserInfo WHERE phone = :phone')
  Future<UserInfo?> findUserByPhone(String phone);
}
