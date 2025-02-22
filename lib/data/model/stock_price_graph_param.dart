// ignore_for_file: public_member_api_docs, sort_constructors_first

class StockPriceGraphParam {
  final int stockId;
  final String range;

  StockPriceGraphParam({
    required this.stockId,
    required this.range,
  });

  @override
  bool operator ==(covariant StockPriceGraphParam other) {
    if (identical(this, other)) return true;

    return other.stockId == stockId && other.range == range;
  }

  @override
  int get hashCode => stockId.hashCode ^ range.hashCode;
}
