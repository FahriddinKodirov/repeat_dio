import 'package:repeat_app/data/model/transfer_model/data_model.dart';


class TransferModel{
 String transfer;
 List<DataModel> data;

 TransferModel({required this.transfer,
                required this.data});

 factory TransferModel.fromJson(Map<String, dynamic> jsonData){
  return TransferModel(
     transfer: jsonData['transfer_date'], 
     data: (jsonData['data'] as List).map((e) => DataModel.fromJson(e)).toList());
 }
}