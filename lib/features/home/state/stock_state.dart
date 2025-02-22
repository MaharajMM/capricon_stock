sealed class SearchStockState {
  const SearchStockState();
}

class InitialSearchStockState implements SearchStockState {
  const InitialSearchStockState();
}

class SearchingStockState implements SearchStockState {
  const SearchingStockState();
}

class SearchStockSuccessState implements SearchStockState {
  const SearchStockSuccessState();
}

class SearchStockErrorState implements SearchStockState {
  final String message;

  const SearchStockErrorState(this.message);

  @override
  bool operator ==(covariant SearchStockErrorState other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
