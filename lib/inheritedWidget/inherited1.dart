import 'package:flutter/material.dart';
import 'package:flutter_challenge/main.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _InheritedTestState();
}

class _InheritedTestState extends State<ParentWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.yellow,
              child: Center(
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: Provider.of(context).text,
                      builder: (context, value, child) {
                        return Text(
                          value,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of(context).text.value = "parent Change!";
                      },
                      child: const Text("button"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: ChildWidget()),
        ],
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({super.key});

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.orange,
      child: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: Provider.of(context).text,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of(context).text.value = "child Change!";
              },
              child: const Text("button"),
            ),
          ],
        ),
      ),
    );
  }
}
