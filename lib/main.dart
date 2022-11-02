import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:six_habits/pages/setup.dart';
import 'package:six_habits/pages/habits.dart';


final prefsProvider = Provider<SharedPreferences>(
	(ref) {throw Error();}
);

void main() async {
	//Needed
	WidgetsFlutterBinding.ensureInitialized();

	final prefs = await SharedPreferences.getInstance();
	//TODO: Remove this when done testing!!
	await prefs.clear();
	runApp(
		ProviderScope(
			overrides: [
				prefsProvider.overrideWithValue(prefs),
			],
			child: const SixHabits(),
		),
	);
}

class SixHabits extends ConsumerWidget {

	const SixHabits({super.key});

	@override
	Widget build(BuildContext context, WidgetRef ref) {
		//Logic to see if they need to setup
		final prefs = ref.read(prefsProvider);
		bool? initialized = prefs.getBool("initialized");
		if (initialized == null) {
			prefs.setBool("initialized", false);
			initialized = false;
		}

		return MaterialApp(
			title: "Six Habits",
			initialRoute: '/',
			routes: {
				'/' : (context) => initialized! ? 
						const HabitScreen() : 
						const SetupScreen(), 
				'/progress' : (context) => const Foo(),
				'/habits' : (context) => const HabitScreen(),
				'/setup' : (context) => const SetupScreen(),
				'/info' : (context) => const Foo(),
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
