import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/widget/shimmerlist.dart';


class VerifiedListPage extends StatelessWidget {
  const VerifiedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Scancontroller>(
      builder: (scancontroller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Verified List'),
          ),
          body:scancontroller.getmypermits.isEmpty?
          //  const Center(
          //   child: Text('List of Verified Cards'),
          // )
          ShimmerLists()
          :ListView(
           
            children:scancontroller.getmypermits.map((d)=> Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              
              child: ListTile(title: Text(d.permitId) ,
              subtitle: Text('${d.dateTime?.day}/${d.dateTime?.month}/${d.dateTime?.year}'),
              ),
            ),
          ).toList()),
        );
      }
    );
  }
}