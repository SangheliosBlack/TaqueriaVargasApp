import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/resources/mappable.dart';
import 'package:taqueria_vargas/features/shared/presentation/providers/cool_data_table.dart/cool_data_table_provider.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/widgets.dart';
import 'package:taqueria_vargas/helpers/extensions.dart';

class CoolDataTable<T extends Mappable> extends ConsumerWidget {

  final List<RowHeader> headers;
  final bool? canEdit;
  final List<T> data;
  final bool isSelectable;
  final String? title;
  final List<Widget> Function(T item) buildRow;
  final List<int>? cellsPerPage;
  final int? totalDocuments;
  final VoidCallback? onRefresh;
  final void Function(T item) onRowTap;
  final bool isLoading;
  final List<Widget>? actionButtons;

  const CoolDataTable({
    super.key,
    required this.data,
    this.canEdit = false,
    required this.headers,
    required this.buildRow,
    this.isSelectable = false,
    this.title = "",
    this.cellsPerPage,
    this.totalDocuments,
    this.onRefresh,
    required this.onRowTap,
    required  this.isLoading,
    this.actionButtons
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<int> defaultCellsPerPage = [10, 25, 30];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(coolDataTableProvider.notifier).updateShowQuantity(
            quantity: cellsPerPage != null ? cellsPerPage!.first : defaultCellsPerPage.first,
            firstTime: true,
          );
    });


    if (headers.isEmpty && !isLoading) {
      return _buildError('Headers cannot be empty.');
    }

  
    return Container(
      height: context.height - MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderLabel(title: title ?? "",actionButtons: actionButtons,),
          _buildHeaders(headers),
          _buildRows(data,context),
          PaginatorDataTable(
            data: data,
            cellsPerPage: cellsPerPage ?? defaultCellsPerPage,
            totalDocuments: totalDocuments ?? 0,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaders(List<RowHeader> headers) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(
        right: canEdit == true ? 0 : 0,
      ),
      height: 50,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey.withValues(alpha: .1),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: isSelectable ? 40 : 0),
        child: Row(
          children: headers,
        ),
      ),
    );
  }

  Widget _buildRows(List<T> items,BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: RefreshIndicator(
          onRefresh: () async {
            onRefresh?.call();
          },
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 700),
            reverseDuration: Duration(milliseconds: 700),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: isLoading ? Center(
            child: SizedBox(
              height: context.height - - MediaQuery.of(context).padding.top - 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    key:ValueKey("data-table-loader")
                  ),
                ],
              ),
            ),
            ): Container(
              height: context.height - - MediaQuery.of(context).padding.top - 140,
              child: ListView.separated(
              key: ValueKey("data-table-${items.length}"),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    
                    final item = items[index];
                    final cells = buildRow(item);
                
                    return GestureDetector(
                      onTap: () => onRowTap.call(item),
                      child: Container(
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? Colors.white
                              : const Color.fromARGB(255, 252, 252, 252),
                        ),
                        child: Row(
                          children: [
                            if (isSelectable)
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                child: const SimpleCheckButton(),
                              ),
                            Expanded(child: RowCellCreation(widgets: cells)),
                            Offstage(
                              offstage: !(canEdit ?? false),
                              child: const EditRow(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => Divider(
                    color: Colors.grey.withValues(alpha: .05),
                    height: 1,
                  ),
                ),
            ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 40),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
