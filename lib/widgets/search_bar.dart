import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_sample/providers/todo_provider.dart';

class TodoSearchBar extends ConsumerStatefulWidget {
  const TodoSearchBar({super.key});

  @override
  ConsumerState<TodoSearchBar> createState() => _TodoSearchBarState();
}

class _TodoSearchBarState extends ConsumerState<TodoSearchBar> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _searchController,
      hintText: 'TODOを検索',
      leading: const Icon(Icons.search),
      trailing: [
        if (_searchController.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              ref.read(todoFilterStateProvider.notifier).updateFilter(
                    (state) => state.copyWith(searchQuery: null),
                  );
            },
          ),
      ],
      onChanged: (value) {
        ref.read(todoFilterStateProvider.notifier).updateFilter(
              (state) => state.copyWith(searchQuery: value),
            );
      },
    );
  }
} 