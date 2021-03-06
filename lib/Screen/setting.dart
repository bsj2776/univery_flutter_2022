import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    /// Set to `true` to see the full possibilities of the iOS Developer Screen
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: size.height - 100,
            color: Color(0xff326295),
            child: SettingsList(
              sections: [
                SettingsSection(
                  title: Text('Common'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: Icon(Icons.language),
                      title: Text('Language'),
                      value: Text('English'),
                    ),
                    SettingsTile.switchTile(
                      onToggle: (value) {},
                      initialValue: true,
                      leading: Icon(Icons.format_paint),
                      title: Text('Enable custom theme'),
                    ),
                    SettingsTile.switchTile(
                      onToggle: (value) {},
                      initialValue: true,
                      leading: Icon(Icons.lock_clock),
                      title: Text('Push Alarm'),
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text('Common'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: Icon(Icons.language),
                      title: Text('Language'),
                      value: Text('English'),
                    ),
                    SettingsTile.switchTile(
                      onToggle: (value) {},
                      initialValue: true,
                      leading: Icon(Icons.format_paint),
                      title: Text('Enable custom theme'),
                    ),
                    SettingsTile.switchTile(
                      onToggle: (value) {},
                      initialValue: true,
                      leading: Icon(Icons.lock_clock),
                      title: Text('Push Alarm'),
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text('Common'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: Icon(Icons.language),
                      title: Text('Language'),
                      value: Text('English'),
                    ),
                    SettingsTile.switchTile(
                      onToggle: (value) {},
                      initialValue: true,
                      leading: Icon(Icons.format_paint),
                      title: Text('Enable custom theme'),
                    ),
                    SettingsTile.switchTile(
                      onToggle: (value) {},
                      initialValue: true,
                      leading: Icon(Icons.lock_clock),
                      title: Text('Push Alarm'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
