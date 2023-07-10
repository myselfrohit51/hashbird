import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hashbird/common/common.dart';
import 'package:hashbird/features/auth/controller/auth_controller.dart';
import 'package:hashbird/features/auth/view/signup_view.dart';
import 'package:hashbird/features/home/view/home_view.dart';
import 'package:hashbird/theme/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HashBird',
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
        data: (user) {
          if (user != null) {
            return const HomeView();
          }
          return const SignUpView();
        },
        error: (error, st) => ErrorPage(
          error: error.toString(),
        ),
        loading: () => const LoadingPage(),
      ),
    );
  }
}