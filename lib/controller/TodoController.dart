import 'package:get/get.dart';
import 'package:my_todo/model/Todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  int index = 1;
  void addTodo(String text) {
    todos.add(Todo(id: index++, text: text, done: false.obs));
  }

  void deleteTodo(index) {
    todos.removeWhere((element) => element.id == index);
  }

  void toggleTodo(index) {
    // todos[index] = Todo(
    //     id: todos[index].id,
    //     text: todos[index].text,
    //     done: !todos[index].done.obs);
    todos[index].done.value = !todos[index].done.value;
  }
}
