import 'package:flutter/material.dart';

abstract interface class MessageService {
  
  Future<void> showBottom({required BuildContext context,required String title, required String message,required Color backgroundColor});
  
}