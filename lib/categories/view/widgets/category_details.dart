import 'package:flutter/material.dart';
import 'package:news_app/sources/view/widgets/sources_tabs.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/error_indicator.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../../../sources/view_model/sources_view_model.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.categoryId});

  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final sourcesViewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    sourcesViewModel.getSourcesByCategoryId(categoryId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sourcesViewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, sourcesViewModel, __) {
          if (sourcesViewModel.isLoading) {
            return const LoadingIndicator();
          } else if (sourcesViewModel.errorMessage != null) {
            return ErrorIndicator(sourcesViewModel.errorMessage!);
          } else {
            return SourcesTabs(sources: sourcesViewModel.sources);
          }
        },
      ),
    );
  }
}
