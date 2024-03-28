import 'package:coolmovies/core/connectivity/dio.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:coolmovies/data/repository/news_notice_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  late NewsNoticeRepository newsRepository;

  setUp(() {
    Dio dio = Dio();
    DioClient dioCliente = DioClient(dio);
    newsRepository = NewsNoticeRepository(dioCliente);
  });

  group("teste repository public place holder :: POSTS", () {
    late NewsNotices newsTest;
    test("get list news notices", () async {
      var response = await newsRepository.getListNewsNotices();

      expect(response, isA<Success>());
    });

    test("post new news notices", () async {
      var response = await newsRepository.postNewsNotices(NewsNotices.empty());

      response.onSuccess((success) => newsTest = success);

      expect(response, isA<Success>());
    });

    test("get a news notices", () async {
      var response = await newsRepository.getNewsNotices(newsTest.uuid);

      expect(response, isA<Success>());
    });
    test("Update a list news notices", () async {
      newsTest.title = "new title";
      var response = await newsRepository.updateNewsNotices(newsTest);

      response.onSuccess((success) => newsTest = success);

      expect(response, isA<Success>());
    });
    test("Delete a news notices", () async {
      var response = await newsRepository.deleteNewsNotices(newsTest.uuid);

      expect(response, isA<Success>());
    });
  });
}
