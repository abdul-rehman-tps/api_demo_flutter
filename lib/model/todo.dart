class Todo {
  late int id;
  String? title;
  bool? completed;

  Todo({required this.id, this.title, this.completed});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['completed'] = completed;
    return map;
  }
}
