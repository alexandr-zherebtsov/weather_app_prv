import 'package:flutter/material.dart';
import 'package:weather_app_prv/shared/utils/time_utils.dart';

Widget buildTimeWidget({
  required BuildContext context,
  required int? time,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, top: 6.0),
    child: Text(
      getDayAndMonth(time),
      softWrap: true,
      style: Theme.of(context).textTheme.bodyText1,
    ),
  );
}
