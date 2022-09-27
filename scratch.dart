import 'dart:io';

void main() {
  performTasks();
}

Future<void> performTasks() async {
  task1();
  String result = await task2();
  task3(result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 completed');
}

Future<String> task2() async {
  String result = "";
  Duration threeSeconds = const Duration(seconds: 3);
  // sleep(threeSeconds);
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 completed');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 completed with $task2Data');
}
