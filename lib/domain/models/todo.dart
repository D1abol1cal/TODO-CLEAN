/* 

TO DO MODEL

this is what a todo object is.

--------------------------------------------------------------------------------

it has these properties:

- id: the unique identifier of the todo
- text: the title of the todo
- isCompleted : a boolean value that indicates if the todo is completed or not

--------------------------------------------------------------------------------

Methods:

- toggle completion on & off

*/

class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.text,
    this.isCompleted = false,
  });

  Todo toggleCompletion() {
    return Todo(
      id: id,
      text: text,
      isCompleted: !isCompleted,
    );
  }
}
