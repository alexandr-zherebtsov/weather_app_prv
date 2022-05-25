import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:weather_app_prv/shared/constants/app_string_keys.dart';
import 'package:weather_app_prv/shared/constants/app_assets.dart';
import 'package:weather_app_prv/shared/styles/colors.dart';
import 'package:weather_app_prv/shared/styles/styles.dart';

ColoredBox getProgress() {
  return ColoredBox(
    color: AppColors.white,
    child: Center(
      child: kIsWeb ? const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
      ) : Platform.isIOS || Platform.isMacOS ? const CupertinoActivityIndicator() : const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
      ),
    ),
  );
}

Widget somethingWentWrongView(BuildContext context) {
  return Column(
    children: <Widget>[
      const Padding(
        padding: EdgeInsets.only(top: 100, bottom: 40),
        child: Icon(
          Icons.flutter_dash,
          color: AppColors.green,
          size: 180,
        ),
      ),
      Text(
        StringsKeys.somethingWentWrong.tr(),
        style: Theme.of(context).textTheme.headline4,
      ),
    ],
  );
}

Container buildNetworkImage(String? url, {bool isProgress = false}) {
  return Container(
    color: AppColors.black.withOpacity(0.03),
    child: url == null ? buildMediaErrorIcon() : url.isEmpty ? buildMediaErrorIcon() :
    Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return isProgress ? getProgress() : const Offstage();
      },
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
        return buildMediaErrorIcon();
      },
    ),
  );
}

Center buildMediaErrorIcon() {
  return const Center(
    child: Icon(Icons.error_outline),
  );
}

PreferredSize appBarDivider() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(1),
    child: buildDivider(),
  );
}

Divider buildDivider() {
  return const Divider(
    thickness: 1,
    height: 1,
    indent: 0,
  );
}

Hero appIcon({
  required double size,
}) {
  return Hero(
    tag: AppStyles.mainIconHT,
    child: Image.asset(
      AppAssets.appIcon,
      height: size,
      width: size,
    ),
  );
}

class PopUpModel {
  final String title;
  final Function func;

  PopUpModel({
    required this.title,
    required this.func,
  });
}
