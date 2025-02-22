import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const InfoChip({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.orange500.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.orange500,
          ),
          SizedBox(width: 6),
          AppText(
            text: label,
            color: AppColors.orange500,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
