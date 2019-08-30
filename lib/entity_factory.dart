import 'package:flutter_app/models/ArticleModel.dart';
import 'package:flutter_app/models/TestModelEntity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ArticleModelEntity") {
      return ArticleModelEntity.fromJson(json) as T;
    } else if (T.toString() == "TestModelEntity") {
      return TestModelEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}