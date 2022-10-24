import 'package:six_habits/services/database_service.dart';

class Day {
	final int day; //Using milliseconds from epoch
	final bool habit1;
	final bool? habit2;
	final bool? habit3;
	final bool? habit4;
	final bool? habit5;
	final bool? habit6;

	Day({
		required this.day,
		required this.habit1,
		this.habit2,
		this.habit3,
		this.habit4,
		this.habit5,
		this.habit6,
	});

	Map<String, dynamic> toMap () {
		return {
			'day': day,
			'habit1': habit1,
			'habit2': habit2,
			'habit3': habit3,
			'habit4': habit4,
			'habit5': habit5,
			'habit6': habit6,
		};
	}
}
