import 'package:shared_preferences/shared_preferences.dart';
import 'models.dart';

class PreferenceServices{
  Future saveSettings(Settings settings)async{
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', settings.name);
    await preferences.setString('password', settings.password);
  }

  Future<Settings> getSettings()async{
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username');
    final password = preferences.getString('password');

    return Settings(
      name: username,
      password: password
    );
  }
}