import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/features/stocks_details/controller/stocks_details_pod.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartCard extends ConsumerStatefulWidget {
  final int stockId;
  const ChartCard({
    super.key,
    required this.stockId,
  });

  @override
  ConsumerState<ChartCard> createState() => _ChartCardState();
}

class _ChartCardState extends ConsumerState<ChartCard> {
  String selectedTimeframe = '1D';
  List<String> timeframes = ['1D', '1W', '1M', '1Y', '5Y'];

  void _fetchStockPriceGraph(String range, int stockId) {
    ref.read(stockPriceGraphProvider.notifier).getStockPriceGraph(
          range: range,
          stockId: stockId,
          onGettingStock: (stockListModel) {},
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Timeframe Selection
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: timeframes.length,
              itemBuilder: (context, index) {
                final isSelected = timeframes[index] == selectedTimeframe;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTimeframe = timeframes[index];
                    });
                    _fetchStockPriceGraph(selectedTimeframe, widget.stockId);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.orange500 : Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: AppText(
                        text: timeframes[index],
                        color: isSelected ? AppColors.grey200 : AppColors.kBlack,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),

          // Price Chart
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 3.1),
                      FlSpot(8, 4),
                      FlSpot(9.5, 3),
                      FlSpot(11, 4),
                    ],
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow.shade700,
                        Colors.orange.shade600,
                      ],
                    ),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.shade700.withOpacity(0.2),
                          Colors.orange.shade600.withOpacity(0.2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
