import 'package:auto_route/annotations.dart';
import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/features/stocks_details/controller/stocks_details_pod.dart';
import 'package:capricon_stock/features/stocks_details/view/widgets/chart_card.dart';
import 'package:capricon_stock/features/stocks_details/view/widgets/comapny_details_card.dart';
import 'package:capricon_stock/features/stocks_details/view/widgets/company_name_price_card.dart';
import 'package:capricon_stock/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:capricon_stock/shared/widget/primary_action_button.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class StocksDetailsPage extends StatelessWidget {
  final int stockId;
  final String? stockImageUrl;
  const StocksDetailsPage({
    super.key,
    required this.stockId,
    this.stockImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return StocksDetailsView(
      stockId: stockId,
      stockImageUrl: stockImageUrl,
    );
  }
}

class StocksDetailsView extends StatelessWidget {
  final int stockId;
  final String? stockImageUrl;
  const StocksDetailsView({
    super.key,
    required this.stockId,
    this.stockImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: AppText(
          text: 'Stock Details',
          fontSize: 18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer(
          builder: (context, ref, child) {
            final stockDetailsAsync = ref.watch(stocksDetailsProvider(stockId));
            return stockDetailsAsync.easyWhen(
              data: (stockDetailsModel) {
                final isPositive = (stockDetailsModel.changePercent ?? 0) >= 0;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CompanyNamePriceCard(
                        changePercent: stockDetailsModel.changePercent,
                        isPositive: isPositive,
                        symbol: stockDetailsModel.symbol ?? 'N/A',
                        name: stockDetailsModel.name ?? 'N/A',
                        price: stockDetailsModel.price,
                        imageUrl: stockDetailsModel.image?.url ?? stockImageUrl,
                      ),
                      SizedBox(height: 20),
                      // Chart Section
                      ChartCard(stockId: stockDetailsModel.id!),
                      SizedBox(height: 20),
                      // Stock Info Cards
                      CompanyDetailsCard(company: stockDetailsModel),

                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildMetricCard(
                              'Market Cap',
                              stockDetailsModel.marketCap?.toString() ?? 'N/A',
                              Icons.monetization_on_outlined,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _buildMetricCard(
                              'Exchange',
                              stockDetailsModel.exchange ?? 'N/A',
                              Icons.show_chart,
                            ),
                          ),
                        ],
                      ),

                      // Action Buttons
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Flexible(
                            child: PrimaryActionButton(
                              labelText: 'Add to Portfolio',
                              onPressed: () {},
                            ).h(50),
                          ),
                          SizedBox(width: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.grey300,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share_outlined),
                              color: AppColors.grey800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                );
              },
              loadingWidget: () => CircularProgressIndicator().centered(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMetricCard(String label, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.orange500,
          ),
          SizedBox(height: 12),
          AppText(
            text: value,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            maxlines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          AppText(
            text: label,
            color: AppColors.grey600,
          ),
        ],
      ),
    );
  }
}
