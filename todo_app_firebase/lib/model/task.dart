class Task {
  String name, details;
  bool completed = false;

  static List<Task> _tasks = [
    // The _ in the variable name makes it private.
    Task('Choose topic', 'testing desc'),
    Task('Drink coffee', null),
    Task('Prepare codelab', null),
    Task('Update SDK', 'Flutter'),
  ];

  static List<Task> get tasks => _tasks;

  static List<Task> get currentTasks =>
      _tasks.where((task) => !task.completed).toList();

  static List<Task> get completedTasks =>
      _tasks.where((task) => task.completed).toList();

  Task(this.name,
      this.details); // Constructor with parameters for creating a Task object
}
