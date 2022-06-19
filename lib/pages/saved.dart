import 'package:flutter/material.dart';
import 'package:chuck_norris_io/utils/jokes_list.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key, required this.jl});

  final JokesList jl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text('Saved jokes'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: jl.list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(jl.list[index]),
            );
          },
        ),
    );
  }
}
