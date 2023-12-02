import 'package:flutter/material.dart';
import 'package:flutter_challenge/inheritedWidget/inherited1.dart';

void main() {
  ValueNotifier<String> text = ValueNotifier<String>("Hello");
  runApp(Provider(text: text, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter Challenge', home: ParentWidget());
  }
}

class Provider extends InheritedWidget {
  const Provider({super.key, required this.child, required this.text})
      : super(child: child);

  final Widget child;
  final ValueNotifier<String> text;

  static Provider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>();
  }

  static Provider of(BuildContext context) {
    final Provider? result = maybeOf(context);
    assert(result != null, 'No Provider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return text != oldWidget.text;
  }
}
