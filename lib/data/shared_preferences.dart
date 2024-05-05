import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getAlertsList(String prefsList) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList(prefsList) == null) {
    await prefs.setStringList(prefsList, []);
  }
  return prefs.getStringList(prefsList)!;
}

Future<void> addStringToList(String value, String prefsList) async {
  print(value);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> currentList = await getAlertsList(prefsList);
  print(currentList);
  currentList.add(value);
  await prefs.setStringList(prefsList, currentList);

  List<String> currentList2 = await getAlertsList(prefsList);
  print(currentList2);
}

Future<void> removeStringFromList(String inputValue, String prefsList) async {
  print(inputValue);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> currentList = await getAlertsList(prefsList);
  print(currentList);
  currentList.removeWhere((value) => value == inputValue);
  await prefs.setStringList(prefsList, currentList);

  List<String> currentList2 = await getAlertsList(prefsList);
  print(currentList2);
}
