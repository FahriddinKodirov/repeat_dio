import 'package:dio/dio.dart';
import 'package:repeat_app/data/api_service/api_client.dart';
import 'package:repeat_app/data/model/album_model/album_model.dart';
import 'package:repeat_app/data/model/categories_model/catrgories_model.dart';
import 'package:repeat_app/data/model/mockoapp_model/mockoapp_model.dart';
import 'package:repeat_app/data/model/my_respon/my_response.dart';
import 'package:repeat_app/data/model/transfer_model/transfer_model.dart';

class ApiService extends ApiClient {
//! --------------- Single AlbumModel ----------------------------

  Future<Album?> getSingleAlbumById(int id) async {
    try {
      Response response = await dio.get('${dio.options.baseUrl}/albums/$id');
      if (response.statusCode == 200) {
        return Album.fromjson(response.data);
      }
    } catch (error) {
      print(error.toString());
    }
  }
//! ------------------------ List TransferModel ------------------------

  Future<List<TransferModel>> getTransfer() async {
    Dio dio = Dio();
    try {
      Response response = await dio
          .get('https://banking-api.free.mockoapp.net/transactions-expenses');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.statusCode.toString());
        return (response.data as List)
            .map((e) => TransferModel.fromJson(e))
            .toList();
      }
    } catch (err) {
      print(err.toString());
    }
    return [];
  }

//! --------------------- UiViewError Single MockoappModel ------------------------------

  Future<MyResponse> getfield() async {
    MyResponse myResponse = MyResponse(error: '');

    try {
      Response response =
          await dio.get('https://dynamic-view-api.free.mockoapp.net/dynamic');
      if (response.statusCode == 200) {
        myResponse.data = MockoappModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }

//!------------------------ UiViewError list CategoryModel --------------------------------

  Future<MyResponse> getAllProducts() async {
    MyResponse myResponse = MyResponse(error: '');
    try {
      Response response =
          await dio.get('https://third-exam.free.mockoapp.net/categories');
      if (response.statusCode == 200) {
        myResponse.data = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}
