import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo/controller/TodoController.dart';

class TodoPage extends StatelessWidget {
  final todoController = Get.put(TodoController());
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: true,
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: textController,
                  onSubmitted: _submitted,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _submitted(textController.text)),
              ),
            ],
          ),
        ),
        // GetX<TodoController>(
        //     init:TodoController(),
        //     builder:(controller){
        //     return ListView.builder(itemCount: controller!.todos?.length ?? 0 ,
        //       shrinkWrap: true,
        //       itemBuilder: (context, index){
        //       return Card(
        //         margin: EdgeInsets.all(12),
        //         child: Padding(
        //           padding: EdgeInsets.all(16),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text('${controller.todos![index].id}'),
        //               Text('${controller.todos![index].text}'),
        //               Checkbox(
        //                 checkColor: Colors.white,
        //                 // fillColor:MaterialStateProperty(Colors.lightBlue),
        //                 value: controller.todos![index].done,
        //                 onChanged: (bool? value) {
        //                   controller.toggleTodo(index);
        //                 },
        //               )
        //             ],
        //           ),
        //         ),
        //       );
        //     },);
        // })
        GetX<TodoController>(builder: (controller) {
          return ListView.builder(
            itemCount: controller!.todos?.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(12),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${controller.todos![index].id}'),
                      Text('${controller.todos![index].text}'),
                      Obx(() => Checkbox(
                            checkColor: Colors.white,
                            value: controller.todos[index].done.value == true
                                ? true
                                : false,
                            onChanged: (value) {
                              print("===");
                              print(controller.todos[index].done.value == true
                                  ? true
                                  : false);
                              controller.toggleTodo(index);
                              print(controller.todos[index].done.value == true
                                  ? true
                                  : false);
                            },
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        })
      ]),
    ));
  }

  void _submitted(String text) {
    todoController.addTodo(text);
    textController.clear();
  }
}
