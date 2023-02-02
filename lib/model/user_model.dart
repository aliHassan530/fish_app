import 'dart:convert';

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  // String? address;
  String? email;
  String? uid;
  String? firstN;
  String? lastN;
  String? city;
  String? state;
  DateTime? dob;
  String? gender;
  String? userType;
  String? subscriptionType;
  bool? isVerified;
  List<String>? favourite;

  // String? firstname;
  // String? lastname;
  // String? dateOfBirth;
  // String? selectBank;
  String? image;

  bool? profilePrivacy;
  int? followers;
  int? followings;

  // String? authToken;
  // String? mobileNumber;

  // String? statusTimeStamp;

  // int? subType;

  static final UserModel userModel = UserModel._internal();

  factory UserModel() {
    return userModel;
  }

  UserModel._internal();

  Map<String, dynamic> toJson() => {
        "email": email,
        "uid": uid,
        "firstN": firstN,
        "lastN": lastN,
        "city": city,
        "state": state,
        "dob": dob,
        "gender": gender,
        "favourite": favourite,
        "subscriptionType": subscriptionType,
        "isVerified": isVerified,
        "image": image,
        "userType": userType,
        "profilePrivacy": profilePrivacy,
        "followers": followers,
        "followings": followings,

        // "isVerified":

        // "mobileNumber": mobileNumber,
        // "statusTimestamp": statusTimeStamp,
        // "address": address,
        // "firstname": firstname,
        // "lastname": lastname,
        // "dateOfBirth": dateOfBirth,
        // "selectBank": selectBank,
        // "image":image,

        // "auth": authToken,
        // "subType": subType
      };
}
