import 'package:flutter/services.dart';
import 'package:tabletop_flow/models/stat.dart';
import 'package:flutter/material.dart';
import 'package:tabletop_flow/models/squadTemplate.dart';

class SquadEditPage extends StatefulWidget
{
  const SquadEditPage({super.key});

  @override
  State<SquadEditPage> createState() => _SquadEditPageState();
}

class _SquadEditPageState extends State<SquadEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _costController = TextEditingController();
  List<Stat> stats = SquadTemplate.defaultStats
      .map((s) => Stat(name: s.name, fullName: s.fullName)..value = 1).toList();

  void _saveSquad() {
    if (!_formKey.currentState!.validate())
      return ;

    final name = _nameController.text.trim();
    final basicCost = int.parse(_costController.text.trim());

    final template = SquadTemplate(
        name: name,
        basicCost: basicCost,
    );

    template.stats = stats
      .map((stat) => Stat(name: stat.name, fullName: stat.fullName)..value = stat.value).toList();

    Navigator.pop(context, template);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Squad"),
        actions: [IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.check))],
      ),
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
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: UnderlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty)
                        return 'Name is required';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: TextFormField(
                    controller: _costController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Basic Cost',
                      border: UnderlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty)
                        return 'Cost is required';
                      return null;
                    },
                  ),
                ),
                ...stats.map((stat) {
                     final name = stat.name;
                     final value = stat.value;

                     return Padding(
                       padding: const EdgeInsets.symmetric(vertical: 12.0),
                       child: DropdownButtonFormField<int>(
                         value: value,
                         decoration: InputDecoration(
                           labelText: stat.fullName,
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
                             stat.value = newValue;
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