import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/sources/view/widgets/sources_tabs.dart';
import 'package:news_app/sources/view_model/sources_states.dart';

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
    return BlocProvider(
      create: (_) => sourcesViewModel,
      child: BlocBuilder<SourcesViewModel, SourcesState>(
        builder: (_, state) {
          if (state is GetSourcesLoadingState) {
            return const LoadingIndicator();
          } else if (state is GetSourcesErrorState) {
            return ErrorIndicator(state.errorMessage);
          } else if (state is GetSourcesSuccessState) {
            return SourcesTabs(sources: state.sources);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
