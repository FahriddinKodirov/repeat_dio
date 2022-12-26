import 'package:flutter/cupertino.dart';
import 'package:repeat_app/data/model/album_model/album_model.dart';
import 'package:repeat_app/data/model/categories_model/catrgories_model.dart';
import 'package:repeat_app/data/model/mockoapp_model/mockoapp_model.dart';
import 'package:repeat_app/data/model/my_respon/my_response.dart';
import 'package:repeat_app/data/model/transfer_model/transfer_model.dart';
import 'package:repeat_app/data/repositories/all_data_repo.dart';

class AllViewModel extends ChangeNotifier {
  AllDataRepo allDataRepo;

  AllViewModel({required this.allDataRepo});

//!---------------- single  Album -----------------------
  Album? album;

  fetchAlbum(int id) async {
    album = await allDataRepo.getMyAlbum(id);
    notifyListeners();
  }
//! ---------------- list Transfer ---------------------------

  List<TransferModel>? transfer;

  fetchTransfer() async {
    transfer = await allDataRepo.getTransfer();
    notifyListeners();
  }

//! ------------------- UiViewError list Category ----------------------------

  List<CategoryModel>? products;
  String ErroUi = '';

  fetchProduct() async {
    MyResponse myResponse = await allDataRepo.getAllProducts();

    if (myResponse.error.isEmpty) {
      products = myResponse.data;
    } else {
      ErroUi = myResponse.error;
    }
    notifyListeners();
  }

//! ------------------- UiViewError single Mockoapp ----------------------------

  MockoappModel? mockoapp;
  String erroUiTwo = '';

  fetchfield() async {
    MyResponse myResponse = await allDataRepo.getAllfield();
    if (myResponse.error.isEmpty) {
      mockoapp = myResponse.data;
    } else {
      erroUiTwo = myResponse.error;
    }
    notifyListeners();
  }
}
