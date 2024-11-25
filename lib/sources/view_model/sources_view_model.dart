import 'package:flutter/material.dart';
import 'package:news_app/shared/service_locator.dart';
import 'package:news_app/sources/data/models/source_response.dart';
import 'package:news_app/sources/repositories/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  late final SourcesRepository sourcesRepository;

  SourcesViewModel() {
    sourcesRepository = SourcesRepository(ServiceLocator.sourcesApiDataSource);
  }

  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSourcesByCategoryId({required String categoryId}) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await sourcesRepository.getSourcesByCategoryId(
          categoryId: categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
