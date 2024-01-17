import 'dart:async';

import 'package:floor/floor.dart';
import 'package:shop/features/feature_auth/data/locale/user_dao.dart';
import 'package:shop/features/feature_auth/data/model/user_info.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [UserInfo])
abstract class UserDataBase extends FloorDatabase {
  UserDao get userdao;
}
