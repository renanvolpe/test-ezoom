//ae15a703-241b-42e9-8f0c-2b30f054fb81

import 'package:coolmovies/data/models/comments/comments.dart';
import 'package:coolmovies/data/repository/comments_repository.dart';
import 'package:coolmovies/data/repository/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  late CommentsRepository commentsRepository;
  late String idNews;

  setUp(() {
    idNews = "4f271f1d-30a7-4459-bf60-7132a73628cf";
    Dio dio = Dio();
    DioClient dioCliente = DioClient(dio);
    commentsRepository = CommentsRepository(dioCliente, idNews);
  });

  group("teste repository public place holder :: POSTS", () {
    late Comments commentTest;
    test("get list comments", () async {
      var response = await commentsRepository.getListComments();

      expect(response, isA<Success>());
    });
    test("Post Comment", () async {
      var response = await commentsRepository.postComments(Comments.empty(idNews));

      response.onSuccess((success) => commentTest = success);

      expect(response, isA<Success>());
    });

    test("Update a list posts", () async {
      commentTest.name = "new title";
      var response = await commentsRepository.putComment(commentTest);

      expect(response, isA<Success>());
    });
    test("Delete a nposts", () async {
      var response = await commentsRepository.deleteComment(commentTest.uuid);

      expect(response, isA<Success>());
    });
  });
}
