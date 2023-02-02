import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class DatabaseMethods {
  static final firestoreRef = FirebaseFirestore.instance;
  static final userRef = firestoreRef.collection("users");

  static Future<Map<String, dynamic>> getUserDetails(userId) async {
    DocumentSnapshot _userData = await userRef.doc(userId).get();
    Map<String, dynamic> data = _userData.data() as Map<String, dynamic>;
    return data;
  }

  //Upload user data to firestore
  static Future<void> uploadUserDatatoFirestore({
    String? email,
    String? uid,
    String? firstN,
    String? lastN,
    String? city,
    String? state,
    List<String>? favourite,
    DateTime? dob,
    String? gender,
    bool? isVerified,
    String? subscriptionType,
    String? image,
    String? userType,
    bool? profilePrivacy,
    int? followers,
    int? followings,
  }) async {
    try {
      UserModel().email = email;
      UserModel().firstN = firstN;
      UserModel().lastN = lastN;
      UserModel().uid = uid;
      UserModel().city = city;
      UserModel().state = state;
      UserModel().gender = gender;
      UserModel().dob = dob;
      UserModel().favourite = favourite;
      UserModel().subscriptionType = subscriptionType;
      UserModel().image = image;
      UserModel().isVerified=isVerified;
      UserModel().userType=userType;
      UserModel().profilePrivacy = profilePrivacy;
      UserModel().followers=followers;
      UserModel().followings=followings;





      // UserModel().mobileNumber = mobileNumber!;

      // UserModel().status = "offline";
      // UserModel().statusTimeStamp = DateTime.now().toString();
      // UserModel().address = "";
      // UserModel().authToken = "";
      // UserModel().subType = 0;

      // await userRef.doc(uid).set(UserModel().toJson());
      UserModel.userModel.email == null
          ? await userRef.doc(uid).update(UserModel().toJson())
          : await userRef.doc(uid).set(UserModel().toJson());
      // if(UserModel.userModel.email==null) {
      //   await userRef.doc(uid).set(UserModel().toJson());
      // }
      // else {
      //   await userRef.doc(uid).update(UserModel().toJson());
      // }
    } catch (e) {
      print(e);
    }
  }
}
