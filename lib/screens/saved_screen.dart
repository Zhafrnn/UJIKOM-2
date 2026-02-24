import 'package:flutter/material.dart';
import '../data/saved_data.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() =>
      _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    super.initState();
    saved.addListener(_update);
  }

  void _update() {
    setState(() {});
  }

  @override
  void dispose() {
    saved.removeListener(_update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorite"),
      ),
      body: saved.items.isEmpty
          ? const Center(
              child: Text("No saved items"),
            )
          : ListView.builder(
              itemCount: saved.items.length,
              itemBuilder: (context, index) {
                final item = saved.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.category),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      saved.toggleSaved(
                          item.name, item.category);
                    },
                  ),
                );
              },
            ),
    );
  }
}
