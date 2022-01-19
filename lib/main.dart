import 'package:flutter/material.dart';
import 'package:overlapping_time/overlapping_time.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // 2020-1-1 01:00 - 2020-1-1 04:00
          final DateTimeRange rangeA = DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 2, 30),
          );
          // 2020-1-1 02:00 - 2020-1-1 05:00
          final DateTimeRange rangeB = DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 5, 0),
          );
          // 2020-1-1 03:00 - 2020-1-1 06:00
          // final DateTimeRange rangeC = DateTimeRange(
          //   start: DateTime(2020, 1, 1, 3, 0),
          //   end: DateTime(2020, 1, 1, 6, 0),
          // );

          final List ranges = [rangeA, rangeB, /*rangeC*/];

          final Map<int, List<ComparingResult>> searchResults = findOverlap(ranges: ranges);

          if(searchResults[2]!.isEmpty){
            print('Appointment Possible');
          }else{
            print('Duration Occupied, Barber Booked');
          }



          //print(searchResults.runtimeType );
          print(searchResults[2].runtimeType);
         // print(searchResults[2]!.first.overlappingRange);

          // Extract range that all 3 ranges overlap with each other
          //final DateTimeRange overlappingRange = searchResults[2]!.first.overlappingRange;
         // print(overlappingRange);
        },
        child: Text('Check Interval'),
      ),
    );
  }
}
