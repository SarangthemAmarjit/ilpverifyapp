import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileUpdate extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData icon;
  const ProfileUpdate(
      {super.key,
      required this.text1,
      required this.text2,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20),
      padding: EdgeInsets.zero,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12),
              color: Colors.white.withOpacity(0.7)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: const Color.fromARGB(255, 44, 114, 4),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        text1,
                        overflow: TextOverflow.visible,
                        style: GoogleFonts.kreon(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Text(text2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.kreon(fontSize: 18)),
                ),
              ],
            ),
          )),
    );
  }
}
