import 'package:repeat_app/data/model/mockoapp_model/Fields_model.dart';


class MockoappModel {
  List<FieldsModel> fields;

  MockoappModel({
    required this.fields,
  });

factory MockoappModel.fromJson(Map<String, dynamic> jsonData){
  return MockoappModel(
    fields: (jsonData['fields'] as List).map((json) => FieldsModel.fromJson(json)).toList());
}
}