import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_prv/shared/constants/app_string_keys.dart';
import 'package:weather_app_prv/shared/constants/app_values.dart';
import 'package:weather_app_prv/shared/styles/widgets.dart';
import 'package:weather_app_prv/shared/utils/utils.dart';

PopupMenuButton<PopUpModel> buildMainPopUp({
  required BuildContext context,
  required List<PopUpModel> popUpItems,
}) {
  return PopupMenuButton<PopUpModel>(
    tooltip: StringsKeys.more.tr(),
    padding: EdgeInsets.zero,
    icon: const Icon(Icons.more_vert),
    onSelected: (v) => v.func(),
    onCanceled: () => FocusScope.of(context).unfocus(),
    itemBuilder: (_) {
      return popUpItems.map((PopUpModel e) {
        return PopupMenuItem<PopUpModel>(
          value: e,
          child: Text(e.title),
        );
      }).toList();
    },
  );
}

RichText buildTempText({
  required BuildContext context,
  required double? temp,
}) {
  return RichText(
    text: TextSpan(
      text: kelvinToCelsius(temp),
      style: Theme.of(context).textTheme.headline1,
      children: <TextSpan>[
        TextSpan(
          text: AppValues.symbolCelsius,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    ),
  );
}

ClipRRect buildWeatherIcon(String? icon) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    child: SizedBox(
      width: 36,
      height: 36,
      child: buildNetworkImage(
        getWeatherImage(icon),
      ),
    ),
  );
}
