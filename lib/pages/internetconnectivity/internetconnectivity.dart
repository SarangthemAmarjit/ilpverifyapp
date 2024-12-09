import 'package:flutter/material.dart';

class InternetConnectivityPage extends StatelessWidget {
  const InternetConnectivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connection Error"),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width:100,
              height:100,
              child:
            
            Image.asset("assets/images/nointernet.png"),
            ),
             const SizedBox(height: 30,),
            const Text("Check Your Internet Connection",style: TextStyle(fontSize: 20),),
            const SizedBox(height: 60,),
            ElevatedButton(onPressed: (){}, child: const Text("Retry",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}