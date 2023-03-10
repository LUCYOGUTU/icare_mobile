import 'package:flutter/material.dart';
import 'package:icare_mobile/application/core/colors.dart';
import 'package:icare_mobile/application/core/spaces.dart';
import 'package:icare_mobile/application/core/text_styles.dart';
import 'package:icare_mobile/domain/value_objects/app_strings.dart';
import 'package:icare_mobile/presentation/core/icare_elevated_button.dart';
import 'package:icare_mobile/presentation/core/utils.dart';
import 'package:intl/intl.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({
    super.key,
    required this.date,
    required this.time,
    required this.doctorFirstName,
    required this.doctorLastName,
    required this.buttonText,
    required this.clinic,
  });

  final String date;
  final DateTime time;
  final String doctorFirstName;
  final String doctorLastName;
  final String buttonText;
  final String clinic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
            color: AppColors.primaryColor.withOpacity(0.25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dateString,
                      style: heavySize16Text(AppColors.blackColor),
                    ),
                    Text(
                      timeString,
                      style: heavySize16Text(AppColors.blackColor),
                    ),
                    Text(
                      doctorString,
                      style: heavySize16Text(AppColors.blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: normalSize16Text(AppColors.blackColor),
                    ),
                    Text(
                      DateFormat.jm().format(time),
                      style: normalSize16Text(AppColors.blackColor),
                    ),
                    Text(
                      '$doctorFirstName $doctorLastName',
                      style: normalSize16Text(AppColors.blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          clinicString,
                          style: heavySize16Text(AppColors.blackColor),
                        ),
                        verySmallVerticalSizedBox,
                        Text(
                          clinic,
                          style: normalSize16Text(AppColors.blackColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: ICareElevatedButton(
                        text: buttonText,
                        onPressed: () {
                          showReviewBottomSheet(context, '$doctorFirstName $doctorLastName');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        smallVerticalSizedBox,
      ],
    );
  }
}
