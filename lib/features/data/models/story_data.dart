import 'package:meta/meta.dart';

@immutable
class StoryData {
  final String name;
  final String url;
  StoryData({
    required this.name,
    required this.url,
  });
}
