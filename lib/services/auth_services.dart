import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart' as apple;

import '../dateBase/database.dart';
import '../model/user_model.dart';

class AuthServices {
  static final auth = FirebaseAuth.instance;
  static final firestoreRef = FirebaseFirestore.instance;
  static final userRef = firestoreRef.collection("users");
  static GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<String> signInWithApple() async {
    String res = "";
    try {
      final result = await apple.TheAppleSignIn.performRequests([
        apple.AppleIdRequest(
            requestedScopes: [apple.Scope.email, apple.Scope.fullName])
      ]);
      if (result.status == apple.AuthorizationStatus.authorized) {
        final appleIdCredential = result.credential;
        final oAuthProvider = OAuthProvider("apple.com");

        final credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleIdCredential!.identityToken!),
          accessToken:
              String.fromCharCodes(appleIdCredential.authorizationCode!),
        );
        await auth.signInWithCredential(credential).then((value) async {
          if (value.user != null) {
            if (value.additionalUserInfo?.isNewUser == true) {
              await DatabaseMethods.uploadUserDatatoFirestore(
                email: value.user!.email,
                uid: value.user!.uid,
                firstN: "",
                lastN: "",
                city: "",
                gender: "",
                favourite: [],
                dob: DateTime(3),
                isVerified: value.user!.emailVerified,
                state: "",
                subscriptionType: "",
                image: "",
                userType: "Apple",
                profilePrivacy: false,
                followers: 0,
                followings: 0,
              );
              res = "ACCreated";
            } else if (value.additionalUserInfo?.isNewUser == false) {
              await userRef.doc(value.user?.uid).get().then((userData) async {
                if (userData.exists) {
                  await setCurrentUserToMap(value.user?.uid);
                } else {
                  await DatabaseMethods.uploadUserDatatoFirestore(
                    email: value.user!.email,
                    uid: value.user!.uid,
                    firstN: "",
                    lastN: "",
                    city: "",
                    gender: "",
                    favourite: [],
                    dob: DateTime(3),
                    isVerified: value.user!.emailVerified,
                    state: "",
                    subscriptionType: "",
                    image: "",
                    userType: "Apple",
                    profilePrivacy: false,
                    followers: 0,
                    followings: 0,
                  );
                }
              });
              res = "LoggedIn";
            }
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      res = e.message!;
    }
    return res;
  }

  static Future<String> signInWithGoogle() async {
    String res = "";
    try {
      // ya funciton GoogleSignInAccount humry mbl ma sa accont nikal kar show karta ha
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      // GoogleSignInAuthentication authentication karta ha fireabse ma
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      await auth.signInWithCredential(authCredential).then((value) async {
        if (value.user != null) {
          // additionalUserInfo ya firebase k funtion ha
          if (value.additionalUserInfo?.isNewUser == true) {
            await DatabaseMethods.uploadUserDatatoFirestore(
              email: value.user!.email,
              uid: value.user!.uid,
              firstN: "",
              lastN: "",
              city: "",
              gender: "",
              favourite: [],
              dob: DateTime(3),
              isVerified: value.user!.emailVerified,
              state: "",
              subscriptionType: "",
              image: "",
              userType: "Google",
              profilePrivacy: false,
              followers: 0,
              followings: 0,
            );
            // List<String> indexList = getSplitIndexList(
            //   value.additionalUserInfo!.profile!["given_name"] +
            //       " " +
            //       value.additionalUserInfo!.profile!["family_name"],
            // );
            // await DatabaseMethods.uploadUserDatatoFirestore(
            //     uid: value.user!.uid,
            //     email: value.user!.email,
            //     username: value.additionalUserInfo!.profile!["given_name"] +
            //         " " +
            //         value.additionalUserInfo!.profile!["family_name"],
            //     // userType: "google",
            //     // isPremium: false,
            //     // mobileNumber: UserModel().mobileNumber,
            //     img: value.user!.photoURL,
            //     searchIndex: indexList,
            //     token: await FirebaseMessaging.instance.getToken()
            //
            // );
            res = "ACCreated";
          } else if (value.additionalUserInfo?.isNewUser == false) {
            await userRef.doc(value.user?.uid).get().then((userData) async {
              if (userData.exists) {
                await setCurrentUserToMap(value.user?.uid);
                // updateUserToken();
              } else {
                // await FirebaseFirestore.instance.collection("users").add({
                //   "uid": value.user!.uid,
                //   "email": value.user!.email,
                //   "userName": value.additionalUserInfo!.profile!["given_name"] +
                //       " " +
                //       value.additionalUserInfo!.profile!["family_name"],
                // });

                // List<String> indexList = getSplitIndexList(
                //   value.additionalUserInfo!.profile!["given_name"] +
                //       " " +
                //       value.additionalUserInfo!.profile!["family_name"],
                // );

                await DatabaseMethods.uploadUserDatatoFirestore(
                  email: value.user!.uid,
                  uid: value.user!.uid,
                  firstN: "",
                  lastN: "",
                  city: "",
                  gender: "",
                  favourite: [],
                  dob: DateTime(3),
                  isVerified: value.user!.emailVerified,
                  state: "",
                  subscriptionType: "",
                  image: "",
                  userType: "google",
                  profilePrivacy: false,
                  followers: 0,
                  followings: 0,
                );
              }
            });
            res = "LoggedIn";
          }
        }
      });
    } on FirebaseAuthException catch (e) {
      // res = e.toString();
      if (e.code == "account-exists-with-different-credential") {
        res = "Account exists with different credentials";
      }
    }
    return res;
  }

  static Future<String?> signUp({
    String? email,
    String? password,
  }) async {
    String? result;
    try {
      // List<String> indexList = getSplitIndexList(username!);
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        // String imag = await uploadProfileImage(image!);
        if (value != null) {
          await DatabaseMethods.uploadUserDatatoFirestore(
            email: email,
            uid: value.user!.uid,
            firstN: "",
            lastN: "",
            city: "",
            gender: "",
            favourite: [],
            dob: DateTime(3),
            isVerified: value.user!.emailVerified,
            state: "",
            subscriptionType: "",
            image: "",
            userType: "email",
            profilePrivacy: false,
            followers: 0,
            followings: 0,
          );
        } else {
          result = "Something went wrong";
        }
        result = "Success";
      });
    } on FirebaseAuthException catch (e) {
      result = e.toString();
    }
    return result;
  }

  static Future<String> resetPassword({String? email}) async {
    String result;
    try {
      await auth.sendPasswordResetEmail(email: email!);
      result = "Success";
    } on FirebaseAuthException catch (e) {
      result = e.message!;
    }
    return result;
  }

  static Future<String?> upDateSignUp({
    String? firstN,
    String? lastN,
    String? city,
    String? state,
    String? gender,
    DateTime? dob,
    String? subscriptionType,
    List<String>? favourite,
    File? image,
    bool? profilePrivacy,
  }) async {
    String? result;
    try {
      var user = FirebaseAuth.instance.currentUser;
      await AuthServices.setCurrentUserToMap(user!.uid);
      String imagUrl = "";
      if (image != null) {
        imagUrl = await uploadProfileImage(image);
        UserModel().image = imagUrl;
        print("function${imagUrl}");
      }
      // else{
      //   imagUrl=UserModel.userModel.image!;
      // }
      print("This is the imagUrl" + imagUrl);
      // print("This is the image url from model" + UserModel().image);
      print("favourite${favourite}");
      await DatabaseMethods.uploadUserDatatoFirestore(
        email: user.email,
        uid: user.uid,
        firstN: firstN != "" ? firstN : UserModel.userModel.firstN,
        lastN: lastN != "" ? lastN : UserModel.userModel.lastN,
        image: imagUrl != "" ? imagUrl : UserModel.userModel.image,
        city: city != "" ? city : UserModel.userModel.city,
        gender: gender != "" ? gender : UserModel.userModel.gender,
        favourite:
            favourite != null ? favourite : UserModel.userModel.favourite,
        dob: dob != null ? dob : UserModel.userModel.dob,
        isVerified: user.emailVerified,
        state: state != "" ? state : UserModel.userModel.state,
        subscriptionType: subscriptionType != ""
            ? subscriptionType
            : UserModel.userModel.subscriptionType,
        userType: UserModel().userType,
        profilePrivacy: profilePrivacy == true
            ? profilePrivacy
            : UserModel.userModel.profilePrivacy,
        followers: 0,
        followings: 0,
      );

      result = "Success";
    } on FirebaseAuthException catch (e) {
      result = e.toString();
    }
    return result;
  }

  static Future<void> logout() async {
    var data = await userRef.doc(FirebaseAuth.instance.currentUser!.uid).get();
    if (data["userType"] == "google") {
      googleSignIn.signOut();
    }
    await auth.signOut();
  }

  static Future<String?> signIn({String? email, String? password}) async {
    // allowing the user to sign in
    String? result;
    try {
      await auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        if (value != null) {
          setCurrentUserToMap(value.user!.uid);
        } else {
          result = "Something went wrong";
        }
        result = "Success";
      });
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  static Future<User?> getCurrentUser() async {
    User currentUser;
    if (FirebaseAuth.instance.currentUser != null) {
      currentUser = FirebaseAuth.instance.currentUser!;
      return currentUser;
    }
  }

  static Future<void> setCurrentUserToMap(userId) async {
    var userMap = await DatabaseMethods.getUserDetails(userId);
    UserModel().email = userMap['email'];
    UserModel().firstN = userMap['firstN'];
    UserModel().lastN = userMap['lastN'];
    UserModel().gender = userMap['gender'];
    UserModel().isVerified = userMap['isVerified'];
    UserModel().image = userMap["image"];
    UserModel().subscriptionType = userMap["subscriptionType"];
    UserModel().state = userMap["state"];
    UserModel().userType = userMap["userType"];
    UserModel().profilePrivacy = userMap["profilePrivacy"];
    UserModel().followers = userMap["followers"];
    UserModel().followings = userMap["followings"];
    // UserModel().favourite = userMap["favourite"];
    // UserModel().dob = userMap['dob'];
    // UserModel().state = userMap['state'];
    UserModel().uid = userId;
  }

  static Future<Map<String, dynamic>> getUserDetails(userId) async {
    // getting user details stored in firebase
    DocumentSnapshot _userData = await userRef.doc(userId).get();
    Map<String, dynamic> data = _userData.data() as Map<String, dynamic>;
    return data;
  }
}

Future<String> uploadProfileImage(File images) async {
  // String type k parmeter ma
  print("upload in");
  String image;
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference ref =
      storage.ref().child("userProfile/images/${DateTime.now().toString()}");
  UploadTask uploadTask = ref.putFile(images);
  TaskSnapshot res = await uploadTask;
  String imageUrl = await res.ref.getDownloadURL();
  image = imageUrl.toString();
  return image;
}
