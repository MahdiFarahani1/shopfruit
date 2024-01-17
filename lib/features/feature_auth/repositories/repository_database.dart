import 'package:shop/features/feature_auth/data/locale/database.dart';
import 'package:shop/features/feature_auth/data/locale/user_dao.dart';
import 'package:shop/features/feature_auth/data/model/user_info.dart';

class DataBaseRepository {
  late UserDao dao;
  DataBaseRepository() {
    initUserDao();
  }

  Future<void> initUserDao() async {
    final database =
        await $FloorUserDataBase.databaseBuilder("app_databse.db").build();
    dao = database.userdao;
  }

  Future<bool> userExistsWithPhone(String phone) async {
    final existingUser = await dao.findUserByPhone(phone);

    return existingUser != null;
  }

  Future<void> addUser(UserInfo user) async {
    dao.addUser(user);
  }

  Future<void> deleteUserByID(UserInfo user) async {
    dao.deleteUser(user);
  }

  Future<List<UserInfo>> getAllUser() async {
    return dao.findAllUserWithDevice();
  }

  Future<UserInfo?> findUserWithpassAndphone(
      {required String phone, required String password}) async {
    return dao.findUserByPhoneAndPassword(phone, password);
  }
}
