import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:six_habits/services/database_service.dart';

class HabitScreen extends ConsumerWidget{
	const HabitScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context, WidgetRef ref) {
		final db = ref.read(databaseProvider);
		return const Scaffold(
			body: Center(
				child: Text("This is the habit screen"),
			),
		);
	}
}
