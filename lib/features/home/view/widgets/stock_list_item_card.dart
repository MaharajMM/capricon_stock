import 'package:auto_route/auto_route.dart';
import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/core/router/router.gr.dart';
import 'package:capricon_stock/data/model/stock_model.dart';
import 'package:capricon_stock/features/home/view/widgets/details_item.dart';
import 'package:capricon_stock/features/home/view/widgets/info_chip.dart';
import 'package:capricon_stock/shared/widget/cache_image_network_widget.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';

class StockListItem extends StatelessWidget {
  final StockModel stock;

  const StockListItem({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            // Navigate to stock detail page
            context.navigateTo(
              StocksDetailsRoute(
                stockId: stock.id!,
                stockImageUrl: stock.image?.url,
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      child: stock.image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CacheNetworkImageWidget(
                                imageUrl: stock.image?.url ?? '',
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: stock.symbol ?? 'N/A',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 4),
                          AppText(
                            text: stock.name ?? 'N/A',
                            color: AppColors.grey600,
                            fontSize: 14,
                            maxlines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // Industry and Exchange info
                Row(
                  children: [
                    InfoChip(
                      icon: Icons.category,
                      label: stock.industry ?? 'N/A',
                    ),
                    SizedBox(width: 12),
                    InfoChip(
                      icon: Icons.real_estate_agent,
                      label: stock.exchange ?? 'N/A',
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // Description
                AppText(
                  text: stock.description ?? 'No description available',
                  color: AppColors.grey700,
                  fontSize: 12,
                  maxlines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12),
                // Additional Info Row
                Row(
                  children: [
                    DetailsItem(
                      label: 'Market Cap',
                      value: stock.marketCap ?? 'N/A',
                    ),
                    SizedBox(width: 16),
                    DetailsItem(
                      label: 'Listed',
                      value:
                          stock.listingDate != null ? _formatDate(stock.listingDate ?? '') : 'N/A',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(String date) {
    try {
      final DateTime dateTime = DateTime.parse(date);
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } catch (e) {
      return date;
    }
  }
}
