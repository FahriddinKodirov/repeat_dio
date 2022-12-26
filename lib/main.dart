import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repeat_app/data/api_service/api_service.dart';
import 'package:repeat_app/data/repositories/all_data_repo.dart';
import 'package:repeat_app/data/screen/my_home_page.dart';
import 'package:repeat_app/view_model/all_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=> AllViewModel(allDataRepo: AllDataRepo(apiService: ApiService(),
    )),
    child: MyApp())
    
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

