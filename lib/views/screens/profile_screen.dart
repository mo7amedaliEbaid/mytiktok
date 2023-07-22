import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mytiktok/views/widgets/texts.dart';

import '../../constants.dart';
import '../../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;

  const ProfileScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.user.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black12,
              leading: const Icon(
                Icons.person_add_alt_1_outlined,
              ),
              actions: const [
                Icon(Icons.more_horiz),
              ],
              title: Text(controller.user['name'],
                  style: normalwhite.copyWith(fontWeight: FontWeight.bold)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      mymaxvertical_space,
                      ClipOval(
                          child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: controller.user['profilePhoto']??errornetworkimage,
                        height: size.height * .14,
                        width: size.width * .3,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                        ),
                      )),
                      mymaxvertical_space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(controller.user['following'],
                                  style: normalwhite.copyWith(
                                      fontWeight: FontWeight.bold)),
                              smallvertical_space,
                              followingtext,
                            ],
                          ),
                          Container(
                            color: Colors.amber.shade900,
                            width: 2,
                            height: 25,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                          ),
                          Column(
                            children: [
                              Text(controller.user['followers'],
                                  style: normalwhite.copyWith(
                                      fontWeight: FontWeight.bold)),
                              smallvertical_space,
                              followerstext,
                            ],
                          ),
                          Container(
                            color: Colors.amber.shade900,
                            width: 2,
                            height: 25,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                          ),
                          Column(
                            children: [
                              Text(controller.user['likes'],
                                  style: normalwhite.copyWith(
                                      fontWeight: FontWeight.bold)),
                              smallvertical_space,
                              likestext,
                            ],
                          ),
                        ],
                      ),
                     mymaxvertical_space,
                      Container(
                        width: size.width*.3,
                       height: size.height*.06,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.amber.shade900,
                          ),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              if (widget.uid == authController.user.uid) {
                                authController.signOut();
                              } else {
                                controller.followUser();
                              }
                            },
                            child: Text(
                              widget.uid == authController.user.uid
                                  ? 'Sign Out'
                                  : controller.user['isFollowing']
                                      ? 'Unfollow'
                                      : 'Follow',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                       SizedBox(
                        height: size.height*.04,
                      ),
                      // video list
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.user['thumbnails'].length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          String thumbnail =
                              controller.user['thumbnails'][index];
                          return CachedNetworkImage(
                            imageUrl: thumbnail,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
