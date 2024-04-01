import 'package:coolmovies/data/models/comments/comments.dart';
import 'package:coolmovies/data/models/comments/item_comment.dart';
import 'package:coolmovies/data/repository/dio.dart';
import 'package:result_dart/result_dart.dart';

abstract class CommentsService {
  getComments(String id);
  getListComments();
  postComments(Comments comments);
  putComment( Comments comments);
  deleteComment(String id);
}

class CommentsRepository implements CommentsService {
  final String _idNews;

  final DioClient request;

  CommentsRepository(this.request, this._idNews);

  final String _endpoint = "/comments";

  @override
  Future<Result<ItemComment, String>> getComments(String id) async {
    Map<String, String> params = {};
    var response = await request.dioGet(endpoint: "$_endpoint/$id", params: params);

    return response.fold(
        (success) => Success(ItemComment.fromJson(success)), (failure) => const Failure("Erro ao requisitar questão"));
  }

  @override
  Future<Result<List<Comments>, String>> getListComments() async {
    Map<String, String>? params = {};

    var response = await request.dioGet(endpoint: _endpoint, params: params);

    return response.fold((success) {
      try {
        List<Comments> listComments = [];
        for (var element in success["items"]) {
          listComments.add(Comments.fromJson(element));
        }

        var newList = listComments.where((e) => e.idNews == _idNews).toList();

        return Success(newList);
      } catch (e) {
        return Failure(e.toString());
      }
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<Comments, String>> postComments(Comments comments) async {
    Map<dynamic, dynamic>? body = {
      "idNews": _idNews,
      "name": comments.name,
      "comment": comments.comment,
      "datetime_post": comments.dateTime,
    };

    var response = await request.dioPost(endpoint: _endpoint, body: body);

    return response.fold((success) =>  Success(Comments.fromJson(success["items"][0])), (failure) => Failure(failure));
  }

  @override
  Future<Result<String, String>> deleteComment(String id) async {
    var response = await request.dioDelete(endpoint: "$_endpoint/$id", body: {});

    return response.fold((success) => const Success("success"), (failure) => Failure(failure));
  }

  @override
  Future<Result<String, String>> putComment( Comments comments) async {
    Map<dynamic, dynamic>? body = {
      "name": comments.name,
      "comment": comments.comment,
    };

    var response = await request.dioPut(endpoint: "$_endpoint/${comments.uuid}", body: body);

    return response.fold((success) => const Success("success"), (failure) => Failure(failure));
  }
}
