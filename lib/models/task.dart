class Task {
  String id;
  String title;
  bool completed;
  String userEmail;

  Task({
    required this.id,
    required this.title,
    this.completed = false,
    required this.userEmail,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
      userEmail: json['user_email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
      'user_email': userEmail,
    };
  }
}
