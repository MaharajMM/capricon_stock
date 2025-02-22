import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  final String label;
  final String value;
  const DetailsItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: label,
            color: AppColors.grey600,
            fontSize: 12,
          ),
          SizedBox(height: 2),
          AppText(
            text: value,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
