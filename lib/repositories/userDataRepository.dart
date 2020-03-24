import 'package:ckpmessaging/models/User.dart';
import 'package:ckpmessaging/providers/baseprovider.dart';
import 'package:ckpmessaging/providers/userDataProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataRepository {
  BaseUserDataProvider userDataProvider = UserDataProvider();

  Future<User> saveDetailsFromGoogleAuth(FirebaseUser user) =>
      userDataProvider.saveDetailsFromGoogleAuth(user);

  Future<User> saveProfileDetails(
          String uid, String profileImageUrl, int age, String username) =>
      userDataProvider.saveProfileDetails(uid, profileImageUrl, age, username);

  Future<bool> isProfileComplete(String uid) =>
      userDataProvider.isProfileComplete(uid);
}