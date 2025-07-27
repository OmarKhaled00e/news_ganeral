import 'dart:developer';

import 'package:news_ganeral/core/constants/constants.dart';
import 'package:news_ganeral/core/network/api_endpoints.dart';
import 'package:news_ganeral/core/network/dio_helper.dart';
import 'package:news_ganeral/features/home/models/top_headlines_model.dart';

class HomeScreenServiecs {
  getTopHeadLineArticle() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topHeadLinesEndpoint,
        query: {'apiKey': AppConstants.newsApiKey, 'country': 'us'},
      );

      if (response.statusCode == 200) {
        TopHeadlinesModel topHeadlinesModel = TopHeadlinesModel.fromJson(
          response.data,
        );
        log(topHeadlinesModel.totalResults.toString());
        return topHeadlinesModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}
