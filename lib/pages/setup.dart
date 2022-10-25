import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetupScreen extends ConsumerWidget{
	const SetupScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context, WidgetRef ref) {
		return const Scaffold(
			body: Center(
				child: Text("This is the setup screen"),
			),
		);
	}
}
