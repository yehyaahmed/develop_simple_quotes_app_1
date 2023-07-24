import 'networking.dart';

class QuotableModel {
  String? tags;
  String? content;
  String? bg;

  Future<void> getQuotable() async {
    Map<String, dynamic> quotableInfo = await NetworkHelper(
      url: 'https://api.quotable.io/random',
    ).getData();


    tags = quotableInfo['authorSlug'];
    content = quotableInfo['content'];

    Map<String, dynamic> imageInfo = await NetworkHelper(
      url: 'https://random.imagecdn.app/v1/image?category=${tags}&format=json',
    ).getData();

    bg = imageInfo['url'];
  }
}
