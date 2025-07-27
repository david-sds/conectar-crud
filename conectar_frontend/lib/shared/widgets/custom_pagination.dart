import 'package:conectar_frontend/shared/models/pagination/pagination_output/pagination_output_model.dart';
import 'package:flutter/material.dart';

class CustomPagination extends StatelessWidget {
  const CustomPagination({
    required this.paginationOutput,
    required this.onChangePage,
    super.key,
  });

  final PaginationOutput paginationOutput;
  final void Function(int pageNumber) onChangePage;

  int get totalNumber => paginationOutput.total ?? 0;

  int get numberOfPages =>
      (totalNumber / paginationOutput.numberPerPage).ceil();

  bool get isFirstPage => firstItem == 1;

  bool get isLastPage => paginationOutput.currentPageIndex == numberOfPages - 1;

  int get firstItem =>
      paginationOutput.currentPageIndex * paginationOutput.numberPerPage + 1;

  int get lastItem => isLastPage
      ? totalNumber
      : (paginationOutput.currentPageIndex * paginationOutput.numberPerPage) +
          paginationOutput.numberPerPage +
          1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 32.0),
        Text(
          '$firstItem-$lastItem de $totalNumber',
        ),
        const SizedBox(width: 32.0),
        IconButton(
          icon: const Icon(Icons.chevron_left),
          padding: EdgeInsets.zero,
          tooltip: '',
          onPressed: isFirstPage
              ? null
              : () => onChangePage(paginationOutput.currentPageIndex),
        ),
        const SizedBox(width: 24.0),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          padding: EdgeInsets.zero,
          tooltip: '',
          onPressed: isLastPage
              ? null
              : () => onChangePage(paginationOutput.currentPageIndex + 2),
        ),
        const SizedBox(width: 14.0),
      ],
    );
  }
}
