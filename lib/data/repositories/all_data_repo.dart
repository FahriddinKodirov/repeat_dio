import 'package:repeat_app/data/api_service/api_service.dart';
import 'package:repeat_app/data/model/album_model/album_model.dart';
import 'package:repeat_app/data/model/my_respon/my_response.dart';
import 'package:repeat_app/data/model/transfer_model/transfer_model.dart';



class AllDataRepo{
  ApiService apiService;
  AllDataRepo({required this.apiService});


  //!-------------------- single Album -----------------------------
  Future<Album?> getMyAlbum(int id) => apiService.getSingleAlbumById(id);

  
  //!-------------------- list Transfer --------------------------------
  Future<List<TransferModel>?> getTransfer() => apiService.getTransfer();

  
  //!-------------------- UiViewError list Category --------------------------------
  Future<MyResponse> getAllProducts() => apiService.getAllProducts();

   
  //!-------------------- UiViewError sinle Mockoapp --------------------------------
  Future<MyResponse> getAllfield() => apiService.getfield(); 
  


}