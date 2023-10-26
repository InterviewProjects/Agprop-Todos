import 'package:domain_package/entities/todo/todo_item.dart';
import 'package:domain_package/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/core_ui_extension.dart';
import 'package:flutter_base/core/widgets/base_reactive_screen_widget.dart';
import 'package:flutter_base/screens/todos/list/todos_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TodosPage extends BaseReactiveScreenWidget<TodosController>{
  TodosPage({required super.widgetKey, required super.params,}): super();

  @override
  TodosController createController() => TodosController(params: params);

  @override
  Widget buildView(BuildContext context) {
    super.buildView(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ["#CB2B93".toColor()!, "#9546C4".toColor()!, "#5E61F4".toColor()!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 16,),
                Text(
                  'Your Todos',
                  style: GoogleFonts.novaSlim(color: '#FFFFFF'.toColor()!.withOpacity(0.8), fontSize: 32, fontWeight: FontWeight.w400),
                  // textAlign: TextAlign.center,
                ).expanded(),
                Image.asset('assets/images/profile.png', width: 36, height: 36).onTap(() { controller.onProfileTap(); }),
                const SizedBox(width: 12,)
              ],
            ),
            Obx(() {
              return controller.todoList.isBlank == true
                  ? _noTodosAvailable()
                  : ListView(
                padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 12),
                children: controller.todoList.map((e) => _todoItemSection(e)).toList(),
              );
            }).expanded()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          controller.onPlusTap();
        },
        // isExtended: true,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }

  Widget _noTodosAvailable() {
    return Center(
      child: Text(
        'No Todos Available! Please tap on + button to add new Todo',
        style: GoogleFonts.novaSlim(color: '#FFFFFF'.toColor()!.withOpacity(0.8), fontSize: 32, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    );
  }
  Widget _todoItemSection(TodoItem todoItem) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: ["#FFFFFF".toColor()!, "#FFFFFF".toColor()!, "#FFFFFF".toColor()!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 0.5, color: Colors.purple),
              color: todoItem.isCompleted == true ? Colors.purple : Colors.white,
            ),
            child: todoItem.isCompleted == true
                ? const Icon(Icons.done, size: 16, color: Colors.white)
                : const SizedBox.shrink(),
          ).onTap(() { controller.onTodoItemRadioTap(todoItem); }),
          const SizedBox(width: 12,),
          Text(
            todoItem.text!,
            textAlign: TextAlign.start,
            style: GoogleFonts.novaFlat(
                fontSize: 14,
                color: Colors.purple.shade800,
                fontWeight: FontWeight.w300,
                decoration: todoItem.isCompleted == true ? TextDecoration.lineThrough : null,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).expanded(),
          const SizedBox(width: 12,),
          const Icon(Icons.delete_outlined, size: 24, color: Colors.red,).onTap(() { controller.onTodoItemDeleteTap(todoItem); }),
        ],
      ),
    ).onTap(() { controller.onTodoItemTap(todoItem); });
  }
}