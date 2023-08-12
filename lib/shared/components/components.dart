import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildArticleItem(article, context) => GestureDetector(
      onTap: () {
        navigateTo(context: context, page: WebViewScreen(url: article["url"]));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("${article['urlToImage']}"))),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  //mainAxisSize: MainAxisSize.min,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Expanded(
                      child: Text(
                        'Title: ${article['title']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[300],
    );

Widget myConditionalList({
  required var condition,
  required var newsType,
  required var newsNumber,
  bool isLoading =false,
}) =>
    ConditionalBuilder(
      condition: condition,
      builder: (BuildContext context) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return buildArticleItem(newsType[index], context);
          },
          separatorBuilder: (context, index) => myDivider(),
          itemCount: newsNumber,
        );
      },
      fallback: (BuildContext context) =>isLoading ? Container() : const Center(
        child: CircularProgressIndicator(),
      ),
    );

Widget myTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String labelText,
  required String? Function(String?) validate,
  String? Function(String)? onChanged,
  String Function(String)? onFieldSubmitted,
  void Function()? onTap,
  Widget? widget,
  IconData? suffixIcon,
  Widget? prefixIcon,
  Widget? prefix,
  Color? focusColor,
  Color? cursorColor,
  Color? iconColor,
  Color? writingColor,
  Color enabledBorderUnderlineColor = Colors.grey,
  Color? hintColor,
  Color? labelColor,
  Color? suffixColor,
  Color? hoverColor,
  Color? fillColor,
  Color? errorColor,
  Color? suffixColorGesture,
  bool obscureText = false,
  double? fontSize,
  InputBorder? border,
  EdgeInsets? contentPadding,
}) =>
    TextFormField(
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      keyboardType: type,
      cursorColor: cursorColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefix: prefix,
        errorStyle: TextStyle(color: errorColor),
        hoverColor: hoverColor,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        focusColor: focusColor,
        labelText: labelText,
        iconColor: iconColor,
        suffixIcon: widget,
        contentPadding: contentPadding,
        labelStyle: TextStyle(color: labelColor),
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: fontSize,
        ),
        filled: true,
        //fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        border: border,
        helperMaxLines: 2,
      ),
      validator: validate,
    );

void navigateTo({required BuildContext context, required Widget page}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
