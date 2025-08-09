class PointOfSaleState {

  final bool isMenuOpen;
  final bool isLoading;

  PointOfSaleState({
    this.isMenuOpen = false,
    this.isLoading = false,
  });

  PointOfSaleState copyWith({
    bool? isMenuOpen,
    bool? isLoading,
  }) {
    return PointOfSaleState(
      isMenuOpen: isMenuOpen ?? this.isMenuOpen,
      isLoading : isLoading ?? this.isLoading,
    );
  }

}