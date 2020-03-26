part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}
//UnInitialised
// AuthinProgress
// Authenticated
// PreFillData
// Unautenticated
// ReceivedProfilePicture
// ProfileUpdateInProgress
// ProfileUpdated

class UnInitialised extends AuthenticationState{
  @override
  // TODO: implement props
  List<Object> get props => null;
  @override
  String toString() {
  return 'Uninitalised';
   }
  
}

class AuthInProgress extends AuthenticationState{
  @override
  String toString() {
  return 'AuthInProgress';
   }

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class Authenticated extends AuthenticationState{
  final FirebaseUser user;
  Authenticated(this.user);
  @override
  // TODO: implement props
  List<Object> get props => null;
  @override
  String toString() {
  return 'Authenticated';
   }  
}

class PreFillData extends AuthenticationState{
  final User user;
  PreFillData(this.user);
  @override
  String toString() {
  return 'PreFillData';
   }

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class UnAuthenticated extends AuthenticationState{
  @override
  String toString() {
  return 'UnAuthenticated';
   }

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ReceivedProfilePicture extends AuthenticationState{
  final File file;
  ReceivedProfilePicture(this.file);
  @override toString() => 'ReceivedProfilePicture';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ProfileUpdateInProgress extends AuthenticationState{
  @override
  String toString() => 'ProfileUpdateInProgress';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ProfileUpdated extends AuthenticationState{
  @override
  String toString() => 'ProfileComplete';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

