import 'package:coolmovies/data/repository/dio.dart';
import 'package:coolmovies/core/const/endpoints.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:result_dart/result_dart.dart';

abstract class NewsNoticeServices {
  getListNewsNotices();
  getNewsNotices(String idNewsNotices);
  postNewsNotices(NewsNotices newNewsNotices);
  deleteNewsNotices(String id);
  updateNewsNotices(NewsNotices post);
}

class NewsNoticeRepository implements NewsNoticeServices {
  final DioClient _request;
  NewsNoticeRepository(this._request);

  final String _endpoint = Endpoints.news;

  @override
  Future<Result<NewsNotices, String>> getNewsNotices(String id) async {
    Map<String, String> params = {};
    var response = await _request.dioGet(endpoint: "$_endpoint/$id", params: params);

    return response.fold(
        (success) => Success(NewsNotices.fromJson(success)), (failure) => const Failure("Erro ao requisitar questão"));
  }

  @override
  Future<Result<List<NewsNotices>, String>> getListNewsNotices() async {
    Map<String, String>? params = {};

    var response = await _request.dioGet(endpoint: _endpoint, params: params);

    return response.fold((success) {
      try {
        List<NewsNotices> listModel = [];
        for (var element in success["items"]) {
          listModel.add(NewsNotices.fromJson(element));
        }

        return Success(listModel);
      } catch (e) {
        return Failure(e.toString());
      }
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<String, String>> deleteNewsNotices(String id) async {
    var response = await _request.dioDelete(endpoint: "$_endpoint/$id");

    return response.fold((success) => const Success("Deleted"), (failure) => Failure(failure));
  }

  @override
  Future<Result<NewsNotices, String>> postNewsNotices(NewsNotices newNewsNotices) async {
    Map<dynamic, dynamic>? body = {
      "description": newNewsNotices.description,
      "title": newNewsNotices.title,
      "wasRead": newNewsNotices.wasRead,
      "photo": "",
      "datetime_post": newNewsNotices.datetimePost
    };

    var response = await _request.dioPost(endpoint: _endpoint, body: body);

    return response.fold(
        (success) => Success(NewsNotices.fromJson(success["items"][0])), (failure) => Failure(failure));
  }

  @override
  Future<Result<NewsNotices, String>> updateNewsNotices(NewsNotices post) async {
    Map<dynamic, dynamic>? body = {"title": post.title, "body": post.description};

    var response = await _request.dioPut(endpoint: "$_endpoint/${post.uuid}", body: body);

    return response.fold((success) => Success(NewsNotices.fromJson(success)), (failure) => Failure(failure));
  }
}
