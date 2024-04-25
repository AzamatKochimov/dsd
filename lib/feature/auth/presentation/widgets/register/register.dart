import 'package:flutter/material.dart';

List<Widget> customTextfield(TextEditingController controller, String title) {
  return [
    Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      height: 50,
      child: TextField(
        style: const TextStyle(color: Colors.black),
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15),
          hintStyle: TextStyle(
              color: Color.fromARGB(112, 0, 0, 0),
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ),
    ),
  ];
}
