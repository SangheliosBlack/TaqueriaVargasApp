class PointOfSaleState {

  final bool isMenuOpen;
  final bool isLoading;
  final bool showMenuContent;

  PointOfSaleState({
    this.isMenuOpen = false,
    this.isLoading = false,
    this.showMenuContent = false,
  });

  PointOfSaleState copyWith({
    bool? isMenuOpen,
    bool? isLoading,
    bool? showMenuContent,
  }) {
    return PointOfSaleState(
      isMenuOpen: isMenuOpen ?? this.isMenuOpen,
      isLoading : isLoading ?? this.isLoading,
      showMenuContent: showMenuContent ?? this.showMenuContent,
    );
  }

}