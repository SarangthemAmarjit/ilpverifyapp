import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/images/loading.json',
          height: 120,
        ),
      ),
    );
  }
}

// Future? _showLoadingDialog() {
//   showDialog(
//     useSafeArea: true,
//     context: context,
//     barrierDismissible: false, // Prevents dialog from being dismissed
//     builder: (BuildContext context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Lottie.asset(
//                 'assets/images/loading3.json',
//                 height: 100,
//               ),
//               const Text(
//                 'Please wait...',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
//   return null;
// }
