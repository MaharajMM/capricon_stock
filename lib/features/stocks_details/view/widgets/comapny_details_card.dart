import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/data/model/stock_model.dart';
import 'package:capricon_stock/features/stocks_details/view/widgets/info_row.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompanyDetailsCard extends StatelessWidget {
  final StockModel company;

  const CompanyDetailsCard({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Row(
              children: [
                Icon(
                  Icons.business_rounded,
                  color: AppColors.orange500,
                ),
                const SizedBox(width: 4),
                AppText(
                  text: 'About',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.orange500,
                ),
              ],
            ),
            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoRow(
                  isCompanyName: true,
                  label: 'Company Name',
                  value: company.name ?? 'N/A',
                  icon: Icons.apartment_rounded,
                ),
                const SizedBox(height: 12),
                _buildDescriptionRow(
                  'Description',
                  company.description ?? 'N/A',
                  Icons.description_rounded,
                ),
                const SizedBox(height: 12),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    // mainAxisExtent: 100,
                    childAspectRatio: 2.25,
                  ),
                  children: [
                    InfoRow(
                      label: 'Asset Type',
                      value: company.assetType ?? 'N/A',
                      icon: Icons.category_rounded,
                    ),
                    InfoRow(
                      label: 'Industry',
                      value: company.industry ?? 'N/A',
                      icon: Icons.factory_rounded,
                    ),
                    InfoRow(
                      label: 'Sector',
                      value: company.sector ?? 'N/A',
                      icon: Icons.business_center_rounded,
                    ),
                    InfoRow(
                      label: 'Listing Date',
                      value: company.listingDate ?? 'N/A',
                      icon: Icons.event_rounded,
                    ),
                    InfoRow(
                      label: 'Created At',
                      value: DateFormat('MMM dd, yyyy').format(company.createdAt!),
                      icon: Icons.access_time_rounded,
                    ),
                    InfoRow(
                      label: 'Updated At',
                      value: DateFormat('MMM dd, yyyy').format(company.updatedAt!),
                      icon: Icons.update_rounded,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildDescriptionRow(String label, String value, IconData icon) {
    return Column(
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
        AppText(
          text: value,
          fontSize: 14,
          maxlines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
