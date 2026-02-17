import 'package:flutter/material.dart';
import 'package:tabletop_flow/models/Player.dart';
import 'package:tabletop_flow/screens/squad_edit_page.dart';

class PlayerEditPage extends StatefulWidget
{
  final Player player;
  const PlayerEditPage({super.key, required this.player});

  @override
  State<PlayerEditPage> createState() => _PlayerEditPageState();
}

class _PlayerEditPageState extends State<PlayerEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.player.name)),
      body: ElevatedButton(
        onPressed: () => _addSquad(),
        child: const Text('Add squad'),
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createSquad,
        label: const Text('Create Squad',
        style: TextStyle(
          fontFamily: 'Oswald',
          letterSpacing: 1.1,
          fontWeight: FontWeight.w600,
          ),
        ),
        icon: const Icon(Icons.add, size: 38,),
      )
    );
  }

  void _createSquad()
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SquadEditPage()
      ),
    );
  }

  void _addSquad() {
    // setState(() {
    //   widget.player.squads.add();
    // });
  }

  void _removeSquad(int index) {
    setState(() {
      widget.player.squads.removeAt(index);
    });
  }

}