import 'package:flutter/material.dart';
import 'package:tabletop_flow/models/Player.dart';
import 'package:tabletop_flow/screens/player_edit_page.dart';

void main() {
  runApp(const TabletopFlow());
}

class TabletopFlow extends StatelessWidget {
  const TabletopFlow({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Players',
      theme: ThemeData(
        textTheme: const TextTheme(
          labelLarge: TextStyle(fontSize: 18),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Add Players Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Player> players = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              final player = players[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  title: Text(player.name,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editPlayer(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deletePlayer(index),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _promptAddPlayer,
        label: const Text('Add Player',
          style: TextStyle(
            fontFamily: 'Oswald',
            letterSpacing: 1.1,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: const Icon(Icons.add, size: 38,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // Function which add a player in the ListView
  Future<void> _promptAddPlayer() async {
    final controller = TextEditingController();
    String? errorText;

  // Display a dialog window which ask to the user to write his name
    final name = await showDialog<String>(
      context: context,
      builder: (context) {
  // Necessary to make the errorText works
        return StatefulBuilder(
          builder: (context, setDialogState) {
            void submit() {
              final text = controller.text.trim();

  // Set the maximum name length and display an error if the name is bigger than authorized
              if (text.length > 32) {
                setDialogState(() {
                  errorText = 'Maximum 32 characters';
                });
                return;
              }

  // Check if the text is empty, and so it does nothing
              if (text.isEmpty) {
                setDialogState(() => errorText = 'Name is required');
                return;
              }

              Navigator.pop(context, text);
            }

            return AlertDialog(
              title: const Text('Add player'),
              content: TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Player name',
                  errorText: errorText,
                ),
                onSubmitted: (_) => submit(),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: submit,
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );

    if (name == null || name.isEmpty) return;

    setState(() {
      players.add(Player(name));
    });

  }

  void _deletePlayer(int index)
  {
    setState(() {
      players.removeAt(index);
    });
  }

  void _editPlayer(int index)
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PlayerEditPage(player: players[index])
      ),
    );
  }

}