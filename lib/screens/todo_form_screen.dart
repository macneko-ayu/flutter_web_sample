import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_sample/models/todo.dart';
import 'package:flutter_web_sample/providers/todo_provider.dart';

class TodoFormScreen extends ConsumerStatefulWidget {
  const TodoFormScreen({
    super.key,
    this.todo,
  });

  final Todo? todo;

  @override
  ConsumerState<TodoFormScreen> createState() => _TodoFormScreenState();
}

class _TodoFormScreenState extends ConsumerState<TodoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _tagController;
  DateTime? _dueDate;
  Priority _priority = Priority.medium;
  final List<String> _tags = [];

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    _titleController = TextEditingController(text: todo?.title);
    _descriptionController = TextEditingController(text: todo?.description);
    _tagController = TextEditingController();
    _dueDate = todo?.dueDate;
    _priority = todo?.priority ?? Priority.medium;
    if (todo != null) {
      _tags.addAll(todo.tags);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo == null ? 'TODO作成' : 'TODO編集'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'タイトル',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'タイトルを入力してください';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '説明',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            _buildDueDateField(context),
            const SizedBox(height: 16),
            _buildPriorityField(),
            const SizedBox(height: 16),
            _buildTagField(),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDueDateField(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: '期限',
        border: OutlineInputBorder(),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _dueDate != null
                  ? '${_dueDate!.year}/${_dueDate!.month}/${_dueDate!.day}'
                  : '期限なし',
            ),
          ),
          TextButton(
            onPressed: () => _selectDate(context),
            child: const Text('選択'),
          ),
          if (_dueDate != null)
            TextButton(
              onPressed: () => setState(() => _dueDate = null),
              child: const Text('クリア'),
            ),
        ],
      ),
    );
  }

  Widget _buildPriorityField() {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: '優先度',
        border: OutlineInputBorder(),
      ),
      child: SegmentedButton<Priority>(
        segments: const [
          ButtonSegment(
            value: Priority.high,
            label: Text('高'),
          ),
          ButtonSegment(
            value: Priority.medium,
            label: Text('中'),
          ),
          ButtonSegment(
            value: Priority.low,
            label: Text('低'),
          ),
        ],
        selected: {_priority},
        onSelectionChanged: (Set<Priority> selected) {
          setState(() {
            _priority = selected.first;
          });
        },
      ),
    );
  }

  Widget _buildTagField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _tagController,
                decoration: const InputDecoration(
                  labelText: 'タグ',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _addTag,
              child: const Text('追加'),
            ),
          ],
        ),
        if (_tags.isNotEmpty) ...[
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _tags
                .map(
                  (tag) => Chip(
                    label: Text(tag),
                    onDeleted: () => setState(() => _tags.remove(tag)),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final selected = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 10),
    );

    if (selected != null) {
      setState(() {
        _dueDate = selected;
      });
    }
  }

  void _addTag() {
    final tag = _tagController.text.trim();
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
        _tagController.clear();
      });
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final todo = widget.todo;
    if (todo == null) {
      // 新規作成
      final newTodo = Todo.create(
        title: _titleController.text,
        description: _descriptionController.text.isEmpty
            ? null
            : _descriptionController.text,
        dueDate: _dueDate,
        priority: _priority,
        tags: _tags,
      );
      await ref.read(todoListProvider.notifier).addTodo(newTodo);
    } else {
      // 更新
      final updatedTodo = todo.copyWith(
        title: _titleController.text,
        description: _descriptionController.text.isEmpty
            ? null
            : _descriptionController.text,
        dueDate: _dueDate,
        priority: _priority,
        tags: _tags,
        updatedAt: DateTime.now(),
      );
      await ref.read(todoListProvider.notifier).updateTodo(updatedTodo);
    }

    if (mounted) {
      Navigator.of(context).pop();
    }
  }
} 