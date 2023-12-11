import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for NewsApi
void main() {
  final instance = Openapi().getNewsApi();

  group(NewsApi, () {
    // Удалить комментарий
    //
    //Future<NewsLikeSuccess> commentDelete(int id) async
    test('test commentDelete', () async {
      // TODO
    });

    // Изменить комментарий
    //
    //Future<NewsLikeSuccess> commentUpdate(int id, { PatchComment patchComment }) async
    test('test commentUpdate', () async {
      // TODO
    });

    // Получение списка новостей
    //
    // Получение списка новостей по убыванию даты с пагинацией
    //
    //Future<GetNews> getNews({ String filter, int pageNumber, int countOnPage }) async
    test('test getNews', () async {
      // TODO
    });

    // Получение комментариев к новости по ID
    //
    //Future<GetCommentsById> newsCommentsIdGet(int id) async
    test('test newsCommentsIdGet', () async {
      // TODO
    });

    // Поблагодарить комментарий
    //
    //Future<CommentLikeSuccess> newsCommentsLikeIdGet(int id) async
    test('test newsCommentsLikeIdGet', () async {
      // TODO
    });

    // Получение информации о новости по ID
    //
    //Future<GetNewsById> newsIdGet(int id) async
    test('test newsIdGet', () async {
      // TODO
    });

    // Поблагодарить новость
    //
    //Future<NewsLikeSuccess> newsLikeIdGet(int id) async
    test('test newsLikeIdGet', () async {
      // TODO
    });

    // Создание нового комментария
    //
    //Future<PostCommentSuccess> newsPostcommentPost({ PostComment postComment }) async
    test('test newsPostcommentPost', () async {
      // TODO
    });

  });
}
