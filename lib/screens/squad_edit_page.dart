import 'package:flutter/material.dart';
import 'package:tabletop_flow/models/squad.dart';

class SquadEditPage extends StatefulWidget
{
  const SquadEditPage({super.key});

  @override
  State<SquadEditPage> createState() => _SquadEditPageState();
}

class _SquadEditPageState extends State<SquadEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  Map<String, int> stats = {};

  @override
  void initState() {
    super.initState();

    for (var key in Squad.statLabels.keys)
      stats[key] = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Squad")),
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                ),
                ...stats.entries.map((entry) {
                     final key = entry.key;
                     final value = entry.value;

                     return Padding(
                       padding: const EdgeInsets.symmetric(vertical: 12.0),
                       child: DropdownButtonFormField<int>(
                         value: value,
                         decoration: InputDecoration(
                           labelText: Squad.statLabels[key],
                           labelStyle: const TextStyle(fontSize: 18),
                           border: const OutlineInputBorder(),
                         ),
                         items: List.generate(20, (i) => i + 1).map((n) => DropdownMenuItem(
                           value: n,
                           child: Text(n.toString()),
                         )).toList(),
                         onChanged: (newValue) {
                           if (newValue == null) return;
                           setState(() {
                             stats[key] = newValue;
                           });
                           },
                       ),
                     );
                  }).toList(),
              ],
            ),
          )
        ),
      ),
    );
  }
}