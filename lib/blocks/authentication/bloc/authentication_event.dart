part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

//Applaunched
//ClickedGoogleSignIn
//LoggedIn
//PickedProfileImage
//Saveprofile
//ClickedLogout

class AppLaunched extends AuthenticationEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() {
    // TODO: implement toString
    return 'AppLaunched';
  }
}

class ClickedGoogleLogin extends AuthenticationEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() {
  return 'ClickedGoogleLogin';
   }
  
}

class LoggedIn extends AuthenticationEvent{

  final FirebaseUser user;
  LoggedIn(this.user);
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() {
  return 'LoggedIn';
   }
  
}

class PickedProfilePicture extends AuthenticationEvent{
  final File file ;
  PickedProfilePicture(this.file);
   
  @override
  // TODO: implement props
  List<Object> get props => null;
  @override
  String toString() {
  return 'PickedProfilePicture';
   }
  
}

class SaveProfile extends AuthenticationEvent{

  final File profileImage;
  final int age;
  final String username;

  SaveProfile(this.profileImage,this.age,this.username);
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() {
  return 'SaveProfile';
   }
  
}

class ClickedLogout extends AuthenticationEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() {
  return 'ClickedLogout';
   }
}
