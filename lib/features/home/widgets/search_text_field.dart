import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/widgets/custom_text_field.dart';
import 'package:news_ganeral/features/search_result/search_result_view.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool showTextField = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextField
            ? CustomTextField(
                width: 200.w,
                hintText: 'search'.tr(),
                onFieldSubmitted: (value) {
                  Navigator.pushNamed(
                    context,
                    SearchResultView.routeName,
                    arguments: value,
                  );
                },
              )
            : SizedBox.shrink(),
        IconButton(
          onPressed: () {
            setState(() {
              showTextField = !showTextField;
            });
          },
          icon: Icon(Icons.search, color: Color(0xFF231F20)),
        ),
      ],
    );
  }
}
