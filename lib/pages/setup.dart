import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:six_habits/services/database_service.dart';
import 'package:six_habits/main.dart';

class SetupScreen extends ConsumerWidget{
	const SetupScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context, WidgetRef ref) {
		final habit1Controller = ref.read(habit1TextInput);
		final habit2Controller = ref.read(habit2TextInput);
		final habit3Controller = ref.read(habit3TextInput);
		final habit4Controller = ref.read(habit4TextInput);
		final habit5Controller = ref.read(habit5TextInput);
		final habit6Controller = ref.read(habit6TextInput);
		final database = ref.read(databaseProvider);
		final prefs = ref.read(prefsProvider);
		return Scaffold(
			body: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: [
					const Text("Input your habits here"),
					Container(
						height: 10,
					),
					TextField(
						controller: habit1Controller,
					),
					TextField(
						controller: habit2Controller,
					),
					TextField(
						controller: habit3Controller,
					),
					TextField(
						controller: habit4Controller,
					),
					TextField(
						controller: habit5Controller,
					),
					TextField(
						controller: habit6Controller,
					),
					ElevatedButton(
						child: const Text("Create habits"),
						onPressed: () {
							if (habit1Controller.text == "") {
								showDialog(
									context: context,
									builder: (context) {
										return const AlertDialog(
											title: Text("Must have 1 habit"),
											content: Text("If this dialog box is being show, you need to have at least 1 habit!\n\tFurther, it's best practice to have your habits in as habit1, habit2, habit3, habit4, etc. Leave no empty boxes in between.")
										);
									}
								);
								return;
							}
							prefs.setBool("initialized", true);
							database.initialize_habits(
								habit1Controller.text, 
								habit2Controller.text, 
								habit3Controller.text,
								habit4Controller.text,
								habit5Controller.text,
								habit6Controller.text);
							Navigator.pushReplacementNamed(context, "/habits");
						},
					),
				],
			),
		);
	}
}

final habit1TextInput = Provider<TextEditingController>((ref) => TextEditingController());
final habit2TextInput = Provider<TextEditingController>((ref) => TextEditingController());
final habit3TextInput = Provider<TextEditingController>((ref) => TextEditingController());
final habit4TextInput = Provider<TextEditingController>((ref) => TextEditingController());
final habit5TextInput = Provider<TextEditingController>((ref) => TextEditingController());
final habit6TextInput = Provider<TextEditingController>((ref) => TextEditingController());
