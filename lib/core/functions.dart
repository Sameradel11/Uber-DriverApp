import 'package:flutter/material.dart';

showsnackbar(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
