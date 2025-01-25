import 'package:flutter/material.dart';
import 'package:noteapp/Widgets/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isloading = false});
  final void Function()? onTap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: kprimarycolor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: isloading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: const CircularProgressIndicator(
                    color: Colors.black,
                  ))
              : const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
        ),
      ),
    );
  }
}
