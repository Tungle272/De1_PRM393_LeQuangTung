import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'viewmodels/theme_viewmodel.dart';
import 'views/task_list_screen.dart';

void main() {
  // ProviderScope bắt buộc phải bọc ngoài cùng để dùng Riverpod
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lấy màu AppBar đã lưu; trong lúc đang đọc thì dùng màu xanh dương
    final appBarColor = ref.watch(appBarColorProvider).value ?? Colors.blue;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản lý công việc',
      theme: ThemeData(
        colorSchemeSeed: appBarColor,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: appBarColor,
          foregroundColor: Colors.white,
        ),
      ),
      home: const TaskListScreen(),
    );
  }
}
