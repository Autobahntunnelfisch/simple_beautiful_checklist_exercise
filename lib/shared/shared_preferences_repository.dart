import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  // Holt die gespeicherten Tasks (Liste von Strings)
  Future<List<String>> getItems() async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList('items') ?? [];
    return items;
  }

  // Gibt die Anzahl der Tasks zurück
  Future<int> get itemCount async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList('items') ?? [];
    return items.length;
  }

  // Fügt ein Item zu den Tasks hinzu
  Future<void> addItem(String item) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> items = prefs.getStringList('items') ?? [];
    items.add(item);
    await prefs.setStringList('items', items);
  }

  // Entfernt ein Item aus den Tasks
  Future<void> removeItem(String item) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> items = prefs.getStringList('items') ?? [];
    items.remove(item);
    await prefs.setStringList('items', items);
  }

  Future<void> editItem(int index, String newValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> items = prefs.getStringList('items') ?? [];
    if (index >= 0 && index < items.length) {
      items[index] =
          newValue; // Bearbeitet den Wert an der entsprechenden Stelle
      await prefs.setStringList(
          'items', items); // Speichert die Liste nach der Bearbeitung
    }
  }
}
