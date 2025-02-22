import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/shared/widget/cache_image_network_widget.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';

class CompanyNamePriceCard extends StatelessWidget {
  final double? changePercent;
  final bool isPositive;
  final String symbol;
  final String name;
  final double? price;
  final String? imageUrl;
  const CompanyNamePriceCard({
    super.key,
    this.changePercent,
    required this.isPositive,
    required this.symbol,
    required this.name,
    this.price,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.yellow.shade700,
            Colors.orange.shade600,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Company Logo and Name
          Row(
            children: [
              // Stock Image
              Container(
                width: 48,
                height: 48,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[100],
                ),
                child: imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CacheNetworkImageWidget(
                          imageUrl: imageUrl ?? '',
                        ),
                      )
                    : Icon(
                        Icons.business,
                        color: Colors.grey[400],
                      ),
              ),
              SizedBox(width: 16),
              // Stock Symbol and Name
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: name,
                      fontSize: 18,
                      maxlines: 2,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AppText(
                        text: symbol,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          // Price and Change
          AppText(
            text: '\$${price?.toStringAsFixed(2) ?? 'N/A'}',
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isPositive ? AppColors.kSuccessColor : AppColors.kErrorColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 4),
                AppText(
                  text: '${changePercent?.abs().toStringAsFixed(2)}%',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
