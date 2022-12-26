import 'package:repeat_app/data/model/transfer_model/receiver_model.dart';


class DataModel{
  int transactionCode;
  String data;
  int expenseId;
  double amount;
  int cardId;
  ReceiverModel receiver;

  DataModel({required this.transactionCode,
             required this.data,
             required this.expenseId,
             required this.amount,
             required this.cardId,
             required this.receiver,});

  factory DataModel.fromJson(Map<String, dynamic> jsonData){
    return DataModel(
                     transactionCode: jsonData['transaction_code'], 
                     data: jsonData['date'], 
                     expenseId: jsonData['expense_id'], 
                     amount: jsonData['amount'], 
                     cardId: jsonData['card_id'], 
                     receiver: ReceiverModel.fromjson(jsonData['receiver']));
  }
}