import "dart:async";
import "package:flutter/material.dart";

class Todo {
  final String title;
  bool completed;

  Todo(this.title, {this.completed = false});
}

class TodoBloc {
  final _todoController = StreamController<List<Todo>>.broadcast();
  final List<Todo> _todos = [];

  Stream<List<Todo>> get todoStream {
    return _todoController.stream;
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    _todoController.sink.add(_todos);
  }

  void toggleTodoCompletion(int index) {
    _todos[index].completed = !_todos[index].completed;
    _todoController.sink.add(_todos);
  }

  void dispose() {
    _todoController.close();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc Items Edit Delete List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const AddToCart(),
    );
  }
}

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() {
    return AddToCartState();
  }
}

class AddToCartState extends State<AddToCart> {
  final TodoBloc _todoBloc = TodoBloc();
  final TextEditingController _controller = TextEditingController();
  final List<String> cartItems = [];

  @override
  void dispose() {
    _controller.dispose();
    _todoBloc.dispose();
    super.dispose();
  }

  void addToCart(String item) {
    setState(
      () {
        cartItems.add(item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: StreamBuilder<List<Todo>>(
        stream: _todoBloc.todoStream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final todo = snapshot.data![index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    child: Text(
                      todo.title[0],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        decoration:
                            todo.completed ? TextDecoration.lineThrough : null),
                  ),
                  subtitle: Text(todo.title),
                  trailing: IconButton(
                    icon: Icon(todo.completed
                        ? Icons.check_box
                        : Icons.check_box_outline_blank),
                    onPressed: () {
                      _todoBloc.toggleTodoCompletion(index);
                    },
                  ),
                  onTap: () {
                    addToCart(todo.title);
                    _todoBloc.toggleTodoCompletion(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${todo.title} Added in the List"),
                        duration: const Duration(seconds: 1),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add data"),
                content: SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    controller: _controller,
                    maxLines: 1,
                    maxLength: 100,
                    decoration: const InputDecoration(
                      hintText: "Enter the data",
                    ),
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      _todoBloc.addTodo(Todo(_controller.text));
                      _controller.clear();
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white, size: 30.0),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // IconButton(),
            Badge(
              backgroundColor: Colors.purple,
              label: const Text("0",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CartPage(cartItems: cartItems);
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Open Cart",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.cartItems});

  final List<String> cartItems;

  @override
  State<CartPage> createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: widget.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://cdni.iconscout.com/illustration/free/thumb/"
                    "free-empty-cart-4085814-3385483.png?f=webp",
                  width: 200.0,
                  height: 200.0,
                ),
                const Text("Your Cart is Empty",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                const SizedBox(height: 30.0),
                const Text("Explore products and shop your favourite items",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),)
          : ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      child: Text(widget.cartItems[index][0],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(widget.cartItems[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.cartItems[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            _showUpdateDialog(
                                context, index, widget.cartItems[index]);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            _deleteItem(index);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  /// CREATING UPDATE METHOD TO UPDATE THE ITEM FROM CART ITEM LIST
  void _showUpdateDialog(BuildContext context, int index, String currentItem) {
    final TextEditingController updateController =
        TextEditingController(text: currentItem);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Item"),
          content: SizedBox(
            width: 300.0,
            child: TextFormField(
              controller: updateController,
              maxLength: 100,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: "Enter updated item",
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    widget.cartItems[index] = updateController.text;
                  },
                );
                Navigator.pop(context);
              },
              child: const Text(
                "Update",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  /// CREATING DELETE METHOD TO DELETE THE ITEM FROM CART ITEM LIST
  void _deleteItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Confirm delete",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text("Are you sure you want to delete this item ?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.cartItems[index]} deleted..."),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.red,
                  ),
                );
                setState(
                  () {
                    widget.cartItems.removeAt(index);
                  },
                );
                Navigator.pop(context);
              },
              child: const Text(
                "Delete",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}