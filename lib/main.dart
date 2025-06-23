import 'package:flutter/material.dart';

void main() {
  runApp(OliraCoffeeApp());
}

class OliraCoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olira Coffee',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TextEditingController> waiterControllers = [];
  List<TextEditingController> tableControllers = [];

  @override
  void initState() {
    super.initState();
    waiterControllers =
        List.generate(3, (i) => TextEditingController(text: 'Waiter${i + 1}'));
    tableControllers =
        List.generate(3, (i) => TextEditingController(text: 'Table${i + 1}'));
  }

  @override
  void dispose() {
    for (var c in waiterControllers) {
      c.dispose();
    }
    for (var c in tableControllers) {
      c.dispose();
    }
    super.dispose();
  }

  Widget buildEditableField(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orangeAccent),
        borderRadius: BorderRadius.circular(8),
        color: Colors.yellow[100],
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.deepOrange,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
      ),
    );
  }

  void addWaiter() {
    int next = waiterControllers.length + 1;
    setState(() {
      waiterControllers
          .add(TextEditingController(text: 'Waiter$next'));
    });
  }

  void addTable() {
    int next = tableControllers.length + 1;
    setState(() {
      tableControllers
          .add(TextEditingController(text: 'Table$next'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Olira Coffee',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.brown[800],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Waiters column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Waiters',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800]),
                  ),
                  SizedBox(height: 8),
                  ...waiterControllers.map(buildEditableField).toList(),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: addWaiter,
                    icon: Icon(Icons.add),
                    label: Text("Add Waiter"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[600],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(width: 24),

            // Tables column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tables',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800]),
                  ),
                  SizedBox(height: 8),
                  ...tableControllers.map(buildEditableField).toList(),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: addTable,
                    icon: Icon(Icons.add),
                    label: Text("Add Table"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[600],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
