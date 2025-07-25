class PaginationOutput {
  final int? total;
  final int? lastPage;
  final int? currentPage;
  final int? totalPerPage;
  final int? prevPage;
  final int? nextPage;

  const PaginationOutput({
    this.total,
    this.lastPage,
    this.currentPage,
    this.totalPerPage,
    this.prevPage,
    this.nextPage,
  });

  int get totalEntries => total ?? 0;

  int get totalPages =>
      numberPerPage != 0 ? (totalEntries / numberPerPage).ceil() : 0;

  int get currentPageIndex => (currentPage ?? 1) - 1;

  int get numberPerPage => totalPerPage ?? 0;

  bool get isLastPage =>
      currentPageIndex ==
      (numberPerPage != 0 ? (totalEntries / numberPerPage).ceil() : 0) - 1;

  int get firstRecord => currentPageIndex * numberPerPage + 1;

  int get lastRecord => isLastPage
      ? totalEntries
      : (currentPageIndex * numberPerPage) + numberPerPage + 1;
}
