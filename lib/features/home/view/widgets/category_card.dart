import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/widgets.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.orange500.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.orange500),
          const SizedBox(width: 8),
          AppText(
            text: title,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
