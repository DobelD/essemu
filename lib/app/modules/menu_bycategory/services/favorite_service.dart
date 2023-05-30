import '../../../data/bool_favorite.dart';
import '../../../provider/endpoint.dart';

class FavoriteService {
  Endpoint endpoint = Endpoint();
  Future<List<FavoriteBool>> getData(int id) async {
    try {
      final response = await endpoint.getFavoriteBool(id);
      final List<FavoriteBool> category = [];
      for (var data in response) {
        final ctg = FavoriteBool.fromJson(data);
        category.add(ctg);
      }
      return category;
    } catch (e) {
      throw "$e";
    }
  }

  Future<void> addFavorite(int users, int menus) async {
    final response = await endpoint.addFavorite(formPayload(users, menus));
    return response;
  }

  Map<String, dynamic> formPayload(int user, int menu) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['user_id'] = user;
    temp['menu_id'] = menu;
    return temp;
  }
}
