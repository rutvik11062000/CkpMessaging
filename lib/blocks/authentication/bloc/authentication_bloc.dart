import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ckpmessaging/config/Paths.dart';
import 'package:ckpmessaging/models/User.dart';
import 'package:ckpmessaging/repositories/authenticationRepository.dart';
import 'package:ckpmessaging/repositories/storageRepository.dart';
import 'package:ckpmessaging/repositories/userDataRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  final UserDataRepository userDataRepository;
  final StorageRepository storageRepository;

  AuthenticationBloc(
      {this.authenticationRepository,
      this.userDataRepository,
      this.storageRepository})
      : assert(authenticationRepository != null),
        assert(userDataRepository != null),
        assert(storageRepository != null);

  @override
  AuthenticationState get initialState => UnInitialised();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    // TODO: implement mapEventToState
    print(event);
    if (event is AppLaunched) {
      yield* mapAppLaunchedToState();
    } else if (event is ClickedGoogleLogin) {
      yield* mapClickedGoogleLoginToState();
    } else if (event is LoggedIn) {
      yield* mapLoggedInToState(event.user);
    } else if (event is PickedProfilePicture) {
      yield ReceivedProfilePicture(event.file);
    } else if (event is SaveProfile) {
      yield* mapSaveProfileToState(
          event.profileImage, event.age, event.username);
    } else if (event is ClickedLogout) {
      yield* mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> mapLoggedOutToState() async* {
    yield UnAuthenticated();
    authenticationRepository.signOutUser();
  }

  Stream<AuthenticationState> mapSaveProfileToState(
      File profileImage, int age, String username) async* {
    yield ProfileUpdateInProgress();
    String profilePictureUrl = await storageRepository.uploadImage(
        profileImage, Paths.profilePicturePath);
    FirebaseUser user = await authenticationRepository.getCurrentUser();
    await userDataRepository.saveProfileDetails(
        user.uid, profilePictureUrl, age, username);
    yield ProfileUpdated();
  }

  Stream<AuthenticationState> mapLoggedInToState(
      FirebaseUser firebaseUser) async* {
    yield ProfileUpdateInProgress(); // shows progress bar
    User user = await userDataRepository.saveDetailsFromGoogleAuth(
        firebaseUser); // save the gAuth details to firestore database
    yield PreFillData(user); // prefill the gauth data in the form
  }

  Stream<AuthenticationState> mapClickedGoogleLoginToState() async* {
    yield AuthInProgress(); //show progress bar
    try {
      FirebaseUser firebaseUser = await authenticationRepository
          .signInWithGoogle(); // show the google auth prompt and wait for user selection, retrieve the selected account
      bool isProfileComplete = await userDataRepository.isProfileComplete(
          firebaseUser.uid); // check if the user's profile is complete
      print(isProfileComplete);
      if (isProfileComplete) {
        yield ProfileUpdated(); //if profile is complete go to home page
      } else {
        yield Authenticated(
            firebaseUser); // else yield the authenticated state and redirect to profile page to complete profile.
        add(LoggedIn(
            firebaseUser)); // also dispatch a login event so that the data from gauth can be prefilled
      }
    } catch (_, stacktrace) {
      print(stacktrace);
      yield UnAuthenticated(); // in case of error go back to first registration page
    }
  }

  Stream<AuthenticationState> mapAppLaunchedToState() async* {
    try {
      yield AuthInProgress(); //show the progress bar
      final isSignedIn = await authenticationRepository
          .isLoggedIn(); // check if user is signed in
      if (isSignedIn) {
        final user = await authenticationRepository.getCurrentUser();
        bool isProfileComplete = await userDataRepository.isProfileComplete(user
            .uid); // if he is signed in then check if his profile is complete
        print(isProfileComplete);
        if (isProfileComplete) {
          //if profile is complete then redirect to the home page
          yield ProfileUpdated();
        } else {
          yield Authenticated(
              user); // else yield the authenticated state and redirect to profile page to complete profile.
          add(LoggedIn(
              user)); // also disptach a login event so that the data from gauth can be prefilled
        }
      } else {
        yield UnAuthenticated(); // is not signed in then show the home page
      }
    } catch (_, stacktrace) {
      print(stacktrace);
      yield UnAuthenticated();
    }
  }
}
