import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/service_locator.dart';
import 'package:news_app/sources/repositories/sources_repository.dart';
import 'package:news_app/sources/view_model/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesState> {
  late final SourcesRepository sourcesRepository;

  SourcesViewModel() : super(SourcesInitialState()) {
    sourcesRepository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }

  Future<void> getSourcesByCategoryId({required String categoryId}) async {
    emit(GetSourcesLoadingState());
    try {
      final sources = await sourcesRepository.getSourcesByCategoryId(
          categoryId: categoryId);
      emit(GetSourcesSuccessState(sources: sources));
    } catch (error) {
      emit(GetSourcesErrorState(errorMessage: error.toString()));
    }
  }
}
