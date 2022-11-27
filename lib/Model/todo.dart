class ToDo{
  String id;
  String toDoText;
  bool isDone;
  
  ToDo({
    required this.id,
    required this.toDoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: "01", toDoText: "Drink Water", isDone: true),
      ToDo(id: "10", toDoText: "Chase Your Dreams", isDone: true),
      ToDo(id: "11", toDoText: "Get Done This Project", isDone: true),
      ToDo(id: "02", toDoText: "Gym Time", isDone: true),
      ToDo(id: "03", toDoText: "Morning Routine"),
      ToDo(id: "04", toDoText: "Do Your Homework"),
      ToDo(id: "05", toDoText: "Clean Bath", isDone: true),
      ToDo(id: "06", toDoText: "Work On Your Project", isDone: true),
    ];
  }
  
}