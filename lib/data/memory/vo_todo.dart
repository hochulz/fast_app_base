enum TodoStatus {
  incomplete,
  ongoing,
  complete;
}

class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.dueDate,
    this.status = TodoStatus.incomplete,
  }) : createdTime = DateTime.now();

  int id;
  String title;
  final DateTime createdTime;
  DateTime? modifiedTime;
  DateTime dueDate;
  TodoStatus status;
}
