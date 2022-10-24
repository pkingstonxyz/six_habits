import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
	runApp(
		const ProviderScope(
			child: SixHabits(),
		),
	);
}

class SixHabits extends StatelessWidget {
	const SixHabits({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: "Six Habits",
			initialRoute: '/',
			routes: {
				'/' : (context) => const Foo(),
				'/progress' : (context) => const Foo(),
				'/habits' : (context) => const Foo(),
				'/setup' : (context) => const Foo(),
			}
		);
	}
}

//TODO: Delete and implement all of me!
class Foo extends ConsumerWidget {
	const Foo({super.key});
	@override
	Widget build(BuildContext context, WidgetRef ref) {
		DateTime rightnow = DateTime.now();
		return Scaffold(
			body: Center(
				child: Text("It is $rightnow")
			),
		);
	}
}
