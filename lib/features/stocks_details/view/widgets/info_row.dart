import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isCompanyName;
  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.isCompanyName = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isCompanyName ? null : const EdgeInsets.all(10),
      decoration: isCompanyName
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.orange500.withOpacity(0.1),
              border: Border.all(
                color: AppColors.orange500,
              ),
            ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: AppColors.orange500,
              ),
              const SizedBox(width: 4),
              AppText(
                text: label,
                color: AppColors.grey600,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Flexible(
            child: AppText(
              text: value,
              fontSize: 14,
              maxlines: 2,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
