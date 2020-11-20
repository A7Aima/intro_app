import 'package:flutter/material.dart';

const kNameText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 30,
);

const kStateText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 20,
);

const kCityText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 20,
);
const kIntroText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  fontSize: 20,
);

const kIndiaText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 40,
);

const kSearchInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
  border: OutlineInputBorder(
    borderSide: BorderSide(width: 0, color: Colors.transparent),
    borderRadius: const BorderRadius.all(
      const Radius.circular(30.0),
    ),
  ),
  filled: true,
  hintStyle: TextStyle(color: Colors.grey),
  hintText: "Search State",
  fillColor: Colors.white,
);

const kNameInputDecorator = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green),
    borderRadius: const BorderRadius.all(
      const Radius.circular(30.0),
    ),
  ),
  hintText: "Enter your Name",
  hintStyle: TextStyle(color: Colors.white),
  filled: true,
  fillColor: Colors.black54,
  border: OutlineInputBorder(
    borderSide: BorderSide(width: 0, color: Colors.transparent),
    borderRadius: const BorderRadius.all(
      const Radius.circular(30.0),
    ),
  ),
);
