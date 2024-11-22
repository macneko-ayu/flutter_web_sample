import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_sample/models/todo.dart';
import 'package:flutter_web_sample/models/todo_filter.dart';
import 'package:flutter_web_sample/widgets/todo_list.dart';
import 'package:flutter_web_sample/widgets/todo_filter_sidebar.dart';
import 'package:flutter_web_sample/widgets/todo_detail_panel.dart';
import 'package:flutter_web_sample/widgets/responsive_layout.dart';
import 'package:flutter_web_sample/screens/todo_form_screen.dart';
import 'package:flutter_web_sample/widgets/search_bar.dart';
import 'package:flutter_web_sample/providers/theme_provider.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOリスト'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TodoSearchBar(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              ref.read(themeModeNotifierProvider.notifier).toggleThemeMode();
            },
          ),
        ],
      ),
      body: const ResponsiveLayout(
        desktop: _DesktopLayout(),
        tablet: _TabletLayout(),
        mobile: _MobileLayout(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TodoFormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 300,
          child: TodoFilterSidebar(),
        ),
        VerticalDivider(width: 1),
        Expanded(
          child: TodoList(),
        ),
        VerticalDivider(width: 1),
        SizedBox(
          width: 400,
          child: TodoDetailPanel(),
        ),
      ],
    );
  }
}

class _TabletLayout extends StatelessWidget {
  const _TabletLayout();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: TodoList(),
        ),
        VerticalDivider(width: 1),
        SizedBox(
          width: 300,
          child: TodoFilterSidebar(),
        ),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return const TodoList();
  }
} 