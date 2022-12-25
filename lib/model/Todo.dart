import 'package:get/state_manager.dart';

class Todo {
  int id;
  String text;
  RxBool done;

  Todo({required this.id, required this.text, required this.done});
}
