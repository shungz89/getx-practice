import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getx_as_sj/api/api_constants.dart';
import 'package:getx_as_sj/models/result/get_user_list_result.dart';
import 'package:getx_as_sj/models/some_object.dart';

import '../models/sub_object.dart';

class UserItemWidget extends StatelessWidget {
  UserItemWidget(this.userItem, {super.key, this.onTap});

  GetUserListResult userItem;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        constraints: BoxConstraints(
          minHeight: 50,
        ),
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              height: 24,
            ),
            Image.network(userItem.avatar ?? "", width: 24, height: 24),
            SizedBox(
              width: 8,
            ),
            Text(
              userItem.first_name ?? "",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              userItem.last_name ?? "",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
