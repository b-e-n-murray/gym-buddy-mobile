import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  Widget _settingsTile(String title, VoidCallback onTap) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 12),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _settingsTile("Account details", () {}),
        _settingsTile("Help", () {}),
        _settingsTile("Report a problem", () {}),
        _settingsTile("Advanced settings", () {}),
      ],
    );
  }
}
