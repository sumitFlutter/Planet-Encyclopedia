
import 'package:flutter/material.dart';

import '../../../utils/helpers/share_helper.dart';
class ThemeProvider with ChangeNotifier{
  bool theme=false;
  ThemeMode mode=ThemeMode.light;
  IconData themeMode=Icons.dark_mode;
  bool pTheme=false;
  ShareHelper shareHelper=ShareHelper();
  String bgImage="assets/background/1.jpeg";
  void setTheme()
  async {
    theme=!theme;
    shareHelper.saveTheme(pTheme: theme);
    pTheme=(await shareHelper.applyTheme())!;
    if(pTheme==true)
    {
      mode=ThemeMode.dark;
      themeMode=Icons.light_mode;
      bgImage="assets/background/2.jpg";
    }
    else if(pTheme==false)
    {
      mode=ThemeMode.light;
      themeMode=Icons.dark_mode;
      bgImage="assets/background/1.jpeg";
    }
    else
    {
      mode=ThemeMode.light;
      themeMode=Icons.dark_mode;
      bgImage="assets/background/1.jpeg";
    }
    notifyListeners();
  }
  void getTheme()
  async{
    if(await shareHelper.applyTheme()==null)
    {
      pTheme=false;
    }
    else
    {
      pTheme=(await shareHelper.applyTheme())!;
    }
    if(pTheme==true)
    {
      mode=ThemeMode.dark;
      themeMode=Icons.light_mode;
      bgImage="assets/background/2.jpg";
    }
    else if(pTheme==false)
    {
      mode=ThemeMode.light;
      themeMode=Icons.dark_mode;
      bgImage="assets/background/1.jpeg";

    }
    else
    {
      mode=ThemeMode.light;
      themeMode=Icons.dark_mode;
      bgImage="assets/background/1.jpeg";
    }
    notifyListeners();
  }
}