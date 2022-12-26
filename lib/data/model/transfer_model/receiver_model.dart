class ReceiverModel{
  String brand_image;
  String name;
  String location;

  ReceiverModel({required this.brand_image,
                 required this.name,
                 required this.location,});

  factory ReceiverModel.fromjson(Map<String, dynamic> jsonData) {
    return ReceiverModel(
       brand_image: jsonData['brand_image'], 
       name: jsonData['name'], 
       location: jsonData['location']
       );
  }
}