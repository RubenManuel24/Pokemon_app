import 'package:flutter/material.dart';
import 'package:pokemon_app/global-functions-and-variables/global_variables.dart';

class CustomDrawerListTile extends StatelessWidget {
  final int newFrameIndex;
  final IconData icon;
  final String title;
  final bool isSelected;
  const CustomDrawerListTile(
      {super.key, required this.newFrameIndex, required this.icon,required this.title,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.pop(context);
        mainFramesPageFramesController.animateToPage(newFrameIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(

          leading: Icon(icon,color: isSelected?Colors.red:Colors.grey,),
          title: Text(title,style: TextStyle(
            fontWeight: isSelected?FontWeight.bold:FontWeight.normal,
            color: isSelected?Colors.red:Colors.grey
          ),),
        ),
      ),
    );
  }
}
