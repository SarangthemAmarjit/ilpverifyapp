import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/const/enum.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/pages/HomePage.dart';
import 'package:ilpverifyapp/widget/shimmerlist.dart';


class VerifiedListPage extends StatelessWidget {
  const VerifiedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Scancontroller>(
      builder: (scancontroller) {
        return SizedBox(
          // appBar: AppBar(
          //   title: const Text('Verified List'),
          // ),
          child:
          scancontroller.permitlistLoading?
          //  const Center(
          //   child: Text('List of Verified Cards'),
          // )
          const ShimmerLists()
          :
          SingleChildScrollView(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:  Text("Scanned Permits",style: TextStyle(fontSize: 20,color: greencol),),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(children: [
                    const Icon(FontAwesomeIcons.filter,size: 14,),
                    const SizedBox(width: 10,),
                      RoundedCard(
                        onPress: (){
                          scancontroller.searchlistFilter(verifylistFilter.all);
                        },
                        title: "Total",isSelected: scancontroller.verifiedList == verifylistFilter.all,),
                      RoundedCard(
                             onPress: (){
                          scancontroller.searchlistFilter(verifylistFilter.verified);
                        },
                        title: "Verified",isSelected: scancontroller.verifiedList == verifylistFilter.verified,),
                      RoundedCard(
                             onPress: (){
                          scancontroller.searchlistFilter(verifylistFilter.expired);
                        },
                        title: "Expired",isSelected: scancontroller.verifiedList == verifylistFilter.expired,),
                      RoundedCard(
                             onPress: (){
                          scancontroller.searchlistFilter(verifylistFilter.fake);
                        },
                        title: "Fake",isSelected: scancontroller.verifiedList == verifylistFilter.fake,),

                    
                  ],),
                ),
                // SizedBox(height: 20,),
                   scancontroller.getmypermitsFilter.isEmpty?const Padding(
                     padding: EdgeInsets.all(16.0),
                     child: SizedBox(
                       height: 400,
                       width: double.maxFinite,
                       child: RoundedCard(
                         isGradient: true,
                         padding: EdgeInsets.all(32),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                         Icon(FontAwesomeIcons.xmarkCircle,color: Colors.white,size: 50,),
                         SizedBox(height: 40,),

                         Text("NO PERMITS TO SHOW",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)
                       ],),),
                     ),
                   ).animate().shimmer(duration: Durations.extralong2) :ListView(
                  physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                  children:scancontroller.getmypermitsFilter.map((d)=> Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    
                    child: ListTile(title: Text(d.permitId) ,
                    subtitle: Text('${d.dateTime?.day}/${d.dateTime?.month}/${d.dateTime?.year}'),
                    ),
                  ),
                ).toList()),
              ],
            ),
          ),
        );
      }
    );
  }
}

class RoundedCard extends StatelessWidget {
  const RoundedCard({
    super.key, this.title,this.isSelected = false, this.onPress, this.child, this.padding,this.isGradient = false,
  });
  final String? title;
  final bool isSelected;
  final VoidCallback? onPress;
  final Widget? child;
  final EdgeInsets? padding;
  final bool isGradient;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: padding??const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        decoration: BoxDecoration(
        gradient:isSelected|| isGradient? LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          // colors: [Colors.orange[400]!,Colors.orange,Colors.green[800]!]
          colors: [Colors.blue[400]!,Colors.blue,Colors.blue[800]!]
          
          ):null,
        color:isSelected?greencol:Colors.grey[100],  
          borderRadius: BorderRadius.circular(8)),
        
        child:title!=null? Text(title??"",style: TextStyle(color: isSelected?Colors.white:null,),):child,
      ),
    );
  }
}