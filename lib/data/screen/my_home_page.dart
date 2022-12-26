import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:repeat_app/view_model/all_view_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio package'),
      ),
      body: Consumer<AllViewModel>(builder: (context, allViewModel, child) {
      
        return Column(children: [
          allViewModel.album != null?
          Column(children: [
          Center(child: Text('Album')),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Text(allViewModel.album!.title),
          Text(allViewModel.album!.id.toString()),
          Text(allViewModel.album!.userId.toString()),
          ]):Column(children: [
            Center(child: Text('No Data Album')),
            ElevatedButton(
                onPressed: () {
                  context.read<AllViewModel>().fetchAlbum(1);
                },
                child: Text('get data')),
          ]),
    //!------------------- Category -------------------------------
        
         Divider(thickness: 1,color: Colors.black),
         allViewModel.products != null?
          Column(children: [
          Center(child: Text('Category')),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Text(allViewModel.products![1].name),
          Text(allViewModel.products![1].created_at),
          Text(allViewModel.products![1].id.toString()),
          ]):Column(children: [
            Center(child: Text('No Data Category')),
            ElevatedButton(
                onPressed: () {
                  context.read<AllViewModel>().fetchProduct();
                },
                child: Text('get data')),
          ]), 
      //!------------------- Mockoapp -------------------------------
        
         Divider(thickness: 1,color: Colors.black),
          allViewModel.mockoapp != null?
          Column(children: [
          Center(child: Text('Mockoapp')),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Text(allViewModel.mockoapp!.fields[1].caption),
          Text(allViewModel.mockoapp!.fields[1].fullCaption),
          Text(allViewModel.mockoapp!.fields[1].group),
          ]):Column(children: [
            Center(child: Text('No Data Mockoapp')),
            ElevatedButton(
                onPressed: () {
                  context.read<AllViewModel>().fetchfield();
                },
                child: Text('get data')),
          ]), 
          //!------------------- Transfer -------------------------------
        
         Divider(thickness: 1,color: Colors.black),
          allViewModel.transfer != null?
          Column(children: [
          Center(child: Text('transfer')),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Text(allViewModel.transfer![1].data[1].amount.toString()),
          Text(allViewModel.transfer![1].data[1].receiver.name),
          Text(allViewModel.transfer![1].data[1].transactionCode.toString()),
          ]):Column(children: [
            Center(child: Text('No Data Transfer')),
            ElevatedButton(
                onPressed: () {
                  context.read<AllViewModel>().fetchTransfer();
                },
                child: Text('get data')),
          ]), 
         
        ]);
      }),
    );
  }
}
