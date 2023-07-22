import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytiktok/constants.dart';
import 'package:mytiktok/views/screens/profile_screen.dart';
import 'package:mytiktok/views/widgets/texts.dart';

import '../../controllers/search_controller.dart';
import '../../models/user.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final MySearchController mysearchController = Get.put(MySearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: TextFormField(
            decoration:  InputDecoration(
              filled: false,
              hintText: 'Search',
              hintStyle: normalwhite.copyWith(fontSize: 18)
            ),
            onFieldSubmitted: (value) => mysearchController.searchUser(value),
          ),
        ),
        body: mysearchController.searchedUsers.isEmpty
            ?  Center(
                child:searchusers_text
              )
            : ListView.builder(
                itemCount: mysearchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  User user = mysearchController.searchedUsers[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(uid: user.uid),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            user.profilePhoto,
                        ),
                        ),
                        title: Text(
                          user.name,
                          style: normalwhite.copyWith(fontSize: 18)
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
