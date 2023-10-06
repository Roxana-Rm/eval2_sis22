import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {

  final TextEditingController? controller;
  final String? isPassWordFaild;
  final String? hintText;

  const FormContainerWidget({super.key,

    this.controller,
    this.isPassWordFaild,
    this.hintText,

  });



  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}