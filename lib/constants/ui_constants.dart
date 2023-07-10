import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hashbird/constants/constants.dart';
import 'package:hashbird/features/explore/view/explore_view.dart';
import 'package:hashbird/features/notifications/views/notification_view.dart';
import 'package:hashbird/features/tweet/widgets/tweet_list.dart';
import 'package:hashbird/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.hashbirdIcon,
        color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static const List<Widget> bottomTabBarPages = [
    TweetList(),
    ExploreView(),
    NotificationView(),
  ];
}