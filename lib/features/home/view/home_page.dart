import 'package:auto_route/annotations.dart';
import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/data/model/stock_model.dart';
import 'package:capricon_stock/features/home/controller/home_pod.dart';
import 'package:capricon_stock/features/home/state/stock_state.dart';
import 'package:capricon_stock/features/home/view/widgets/category_card.dart';
import 'package:capricon_stock/features/home/view/widgets/insight_card.dart';
import 'package:capricon_stock/features/home/view/widgets/log_out_btn.dart';
import 'package:capricon_stock/features/home/view/widgets/stock_list_item_card.dart';
import 'package:capricon_stock/shared/utilities/utilites.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  final List<StockModel> _searchResults = [];
  bool _isSearching = false;
  late BuildContext? loadingStocksdialogContext;

  /// Fetches stocks based on the search query
  void _fetchStocks(String query) {
    HapticFeedback.lightImpact();
    Feedback.forTap(context);
    ref.read(searchStockProvider.notifier).searchstock(
          query: query,
          onGettingStock: (stockListModel) {
            // Close loading dialog when search is complete
            if (loadingStocksdialogContext != null) {
              Navigator.of(loadingStocksdialogContext!).pop();
            }
            setState(() {
              _searchResults.clear();
              _searchResults.addAll(stockListModel);
            });
          },
        );
  }

  @override
  void dispose() {
    // Dispose the search controller to free memory
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen for stock search state changes (loading, error, success)
    ref.listen(
      searchStockProvider,
      (previous, next) {
        if (next.value is SearchingStockState) {
          // Show loading dialog
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              loadingStocksdialogContext = context;
              return PopScope(
                canPop: true,
                child: Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SizedBox(
                    height: 100,
                    width: 50,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation(AppColors.orange500),
                      ),
                    ),
                  ),
                ).w(50),
              );
            },
          );
        } else if (next.value is SearchStockErrorState) {
          // Dismiss dialog and show error message
          Navigator.of(loadingStocksdialogContext!).pop();
          Utilities.flushBarErrorMessage(
              message: 'Something wet wrong. Please try late', context: context);
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🏆 **Header Section (Welcome Text)**
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: 'Welcome back,',
                          fontSize: 16,
                          color: AppColors.grey600,
                        ),
                        const SizedBox(height: 4),
                        AppText(
                          text: 'Find Your Perfect Stock',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    LogOutBtn(),
                  ],
                ),
              ),
              12.heightBox,

              /// 🔍 **Search Bar**
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search stocks by name or symbol...',
                    hintStyle: GoogleFonts.poppins(color: AppColors.grey600),
                    prefixIcon: Icon(Icons.search, color: AppColors.orange500),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _searchController.clear();
                                _searchResults.clear();
                                _isSearching = false;
                              });
                            },
                            child: Icon(Icons.close, color: AppColors.orange500),
                          )
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.orange500, width: 2),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        _searchResults.clear();
                        _isSearching = false;
                      }
                      _isSearching = true;
                    });
                  },
                  onSubmitted: (query) {
                    setState(() {
                      _isSearching = false;
                    });
                    if (query.isNotEmpty) {
                      _fetchStocks(query); // Call API when search button is pressed
                    }
                  },
                ),
              ),

              /// 📌 **Main Content (Stock Listings & Categories)**
              if (!_isSearching && _searchResults.isEmpty)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),

                        /// 🔥 **Popular Categories**
                        AppText(
                          text: 'Popular Categories',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CategoryCard(title: 'Technology', icon: Icons.computer),
                              CategoryCard(title: 'Finance', icon: Icons.account_balance),
                              CategoryCard(title: 'Healthcare', icon: Icons.health_and_safety),
                              CategoryCard(title: 'Energy', icon: Icons.bolt),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        /// 📊 **Market Insights**
                        AppText(
                          text: 'Market Insights',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 16),
                        InsightCard(
                          title: 'Market Overview',
                          description: 'Stay updated with the latest market trends and analysis.',
                          icon: Icons.trending_up,
                        ),
                        const SizedBox(height: 16),
                        InsightCard(
                          title: 'Top Gainers',
                          description: 'Discover stocks with the highest growth today.',
                          icon: Icons.arrow_upward,
                        ),
                        const SizedBox(height: 16),
                        InsightCard(
                          title: 'Most Active',
                          description: 'See which stocks are trading the most.',
                          icon: Icons.show_chart,
                        ),
                      ],
                    ),
                  ),
                )
              else if (_isSearching)
                SizedBox(height: 20)
              else

                /// 📌 **Stock Search Results**
                Expanded(
                  child: ListView.separated(
                    itemCount: _searchResults.length,
                    padding: EdgeInsets.only(bottom: 20, top: 8),
                    itemBuilder: (context, index) {
                      final stockItem = _searchResults[index];
                      return StockListItem(stock: stockItem);
                    },
                    separatorBuilder: (context, index) => 12.heightBox,
                  ).pOnly(top: 20),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
