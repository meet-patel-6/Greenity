import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greener_v1/Citizen/bottomnav.dart';
import 'package:get/get.dart';

import '../AMC Team Home/amc_nav.dart';
import '../sponser/sponsor_home.dart';

class DatabaseMethods {
  // Add user data to database
  Future addUserInfoToDBUser(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future initTreeConfig(String uid, String email) {
    return FirebaseFirestore.instance.collection("counter").doc(uid).set({
      'free': 0,
      'subscription': 0,
      'email': email,
    });
  }

  void getUserFromDBUser(String mail) async {
    String rol = '';
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: mail)
        .get();

    for (var doc in querySnapshot.docs) {
      rol = doc.get('role');
    }

    if (rol == 'citizen') {
      Get.offAll(() => const Bottom_Nav());
    }
    if (rol == 'teamMember' || rol == 'teamMember(Leader)') {
      Get.offAll(() => const AMC_Nav());
    }
    if (rol == 'sponsor') {
      Get.offAll(() => const Sponsor_Home());
    }
  }
}
