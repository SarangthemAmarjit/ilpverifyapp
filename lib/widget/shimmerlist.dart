import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLists extends StatelessWidget {
  const ShimmerLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child:  SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 40,),
             
                
          
                      Container(
                  
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200]
                  ),
                  child:SizedBox() ,),
                          Container(
                  
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200]
                  ),
                  child:SizedBox() ,),
                          Container(
                  
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200]
                  ),
                  child:SizedBox() ,),
                          Container(
                  
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200]
                  ),
                  child:SizedBox() ,),
                          Container(
                  
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200]
                  ),
                  child:SizedBox() ,),
                          Container(
                  
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200]
                  ),
                  child:SizedBox() ,),
                          Container(
                  
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200]
                  ),
                  child:SizedBox() ,),
                          Container(
                  
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200]
                  ),
                  child:SizedBox() ,),

            
           
              ],
            ),
          ));
  }
}