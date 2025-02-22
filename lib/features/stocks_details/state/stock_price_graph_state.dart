sealed class StockPriceGraphState {
  const StockPriceGraphState();
}

class InitialStockPriceGraphState implements StockPriceGraphState {
  const InitialStockPriceGraphState();
}

class SearchingStockPriceGraphState implements StockPriceGraphState {
  const SearchingStockPriceGraphState();
}

class StockPriceGraphSuccessState implements StockPriceGraphState {
  const StockPriceGraphSuccessState();
}

class StockPriceGraphErrorState implements StockPriceGraphState {
  final String message;

  const StockPriceGraphErrorState(this.message);

  @override
  bool operator ==(covariant StockPriceGraphErrorState other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
