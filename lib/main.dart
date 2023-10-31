import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoList(title: 'Flutter Todo List App'),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.title});

  final String title;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Todo> _todos = <Todo>[];
  final TextEditingController _textEditingController = TextEditingController();

  void _addTodo(String todoName) {
    setState(() {
      _todos.add(Todo(todoName: todoName, completed: false));
    });

    _textEditingController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add new Todo'),
          content: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(hintText: 'Insert your Todo'),
            autofocus: true,
          ),
          actions: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodo(_textEditingController.text);
                },
                child: const Text('New'))
          ],
        );
      },
    );
  }

  void _handleChange(Todo todo) {
    setState(() {
      todo.completed = !todo.completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: _todos.map((Todo todo) {
          return TodoItem(
            todo: todo,
            onChanged: _handleChange,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Todo {
  Todo({required this.todoName, required this.completed});
  String todoName;
  bool completed;
}

class TodoItem extends StatelessWidget {
  TodoItem({required this.todo, required this.onChanged})
      : super(key: ObjectKey(todo));
  final Todo todo;

  final void Function(Todo todo) onChanged;

  TextStyle? _getTextStyle(bool checked) {
    // return nothing if not checked
    if (!checked) return null;

    return const TextStyle(
        color: Colors.black87, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onChanged(todo);
      },
      leading: Checkbox(
        checkColor: Colors.green.shade400,
        activeColor: Colors.red.shade500,
        value: todo.completed,
        onChanged: (value) {
          onChanged(todo);
        },
      ),
      title: Row(children: <Widget>[
        Expanded(
            child: Text(todo.todoName, style: _getTextStyle(todo.completed))),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          alignment: Alignment.centerRight,
          onPressed: () {},
        )
      ]),
    );
  }
}
