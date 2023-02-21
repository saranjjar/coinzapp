
import 'package:flutter/material.dart';

void NavigatorTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context) => widget),
);

void NavigateAnfFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
      builder: (context) => widget
  ),
      (rout) => false,
);


Widget D_TextFromField({
  required TextEditingController controller,
  required String label,
  required IconData prefixIcon,
  required TextInputType keyboardType,
  String? Function(String?)? validator,
  Function()? onTap,
  String? Function(String?)? onChange,
  String? Function(String?)? onSubmitted,
  TextStyle? labelStyle,
  TextStyle? styleOutDecoration,
  String? hintText,
  double hintStyleFS = 15,
  double borderSideWidth = 3,
  double borderRadiusCircular = 13,
  Color? prefixIconColor,
  IconData? suffixIcon,
  Function()? suffixPressed,
  bool isobscureText = false,
  String? InitialValue
}) =>
    TextFormField(
      showCursor: true,
      readOnly: true,
      initialValue: InitialValue,
      validator: validator,
      controller: controller,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onSubmitted,
      keyboardType: keyboardType,
      style: styleOutDecoration,
      obscureText: isobscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: hintStyleFS,
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor,
        ),
        label: Text(label),
        labelStyle: labelStyle,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: borderSideWidth, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusCircular)),
        ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffixIcon),
        ),
      ),
    );

Widget D_MaterialButton(
    {
      required Function() onPressed,
      Color backgroundColorButton = Colors.lightBlueAccent,
      double width = double.infinity,
      bool isUpperCase = true,
      String text ='',
      Color textColor = Colors.white,
      double paddingSpace = 16.0,
      double raduis = 5.0,
      Color? color
    }) =>
    Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(raduis),
        ),
        color: color
        ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
          ),
        ),
      ),
    );

Widget D_TextButton ({
  required Function() onPressed,
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) => TextButton(
  onPressed: onPressed,
  child: Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,

    ),
  ),
);


Widget MyDivided ({required Color color, double? withOpacity}) => Container(
  width: double.infinity,
  height: 1,
  color: color,
);

void printFullText(String text){

  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
Widget textFormFailed({TextEditingController? valueController}){
  return Container(
    padding: EdgeInsetsDirectional.zero,
    width: 140,
    child: TextFormField(
      controller: valueController,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1,color: Colors.grey),
              borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1,color: Colors.grey),
              borderRadius: BorderRadius.circular(8)
          )
      ),
    ),
  );
}