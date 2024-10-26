import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/model/user_model.dart';
import 'package:hotel/service/auth.dart';
import 'package:hotel/service/firestore_service.dart';
import '../../core/color.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({
    super.key,
  });

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  FireStoreService fireStore = FireStoreService();
  final AuthorizationService auth = Get.find<AuthorizationService>();
  UserModel? user;
  String? activeUserId;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }
//ayrı bir classtan verilerin çekilmesi gerekiyor

  Future<void> _fetchUserData() async {
    activeUserId=auth.activeUserId.value;
    if (activeUserId != null) {
      UserModel? fetchedUser = await fireStore.getUser(activeUserId!);
      print("mail: ${fetchedUser!.email}");
      setState(() {
        user = fetchedUser;
        print(user?.email);
      });
    }else{
      print("user null");
    }
    print(activeUserId);
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Obx((){
      activeUserId = auth.activeUserId.value;
      return Column(
        children: [
          user!.photoUrl!.isEmpty?CircleAvatar(
            backgroundColor: ColorConstants.black,
            radius: 50,
          ):
          CircleAvatar(
            backgroundImage: NetworkImage(user!.photoUrl ?? "",scale: 1.0),
            radius: 50,
          ),
          Text(
            user!.fullName ?? 'No Name',
            style: Get.textTheme.bodySmall!.copyWith(
                color: ColorConstants.black, fontWeight: FontWeight.bold),
          ),
          Text(
            user!.email ?? 'No Email',
            style:
            Get.textTheme.labelMedium!.copyWith(color: ColorConstants.black),
          )
        ],
      );
    }
    );
  }
}
