import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_sample/models/todo.dart';
import 'package:flutter_web_sample/models/todo_filter.dart';
import 'package:flutter_web_sample/widgets/todo_list.dart';
import 'package:flutter_web_sample/widgets/todo_filter_sidebar.dart';
import 'package:flutter_web_sample/widgets/responsive_layout.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOリスト'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: 検索機能の実装
            },
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              // TODO: テーマ切り替え機能の実装
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
          // TODO: TODO作成画面への遷移
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