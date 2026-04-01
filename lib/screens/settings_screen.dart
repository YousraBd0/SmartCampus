import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Paramètres", style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: Colors.white),
      body: ListView(padding: const EdgeInsets.all(24), children: [
        _buildSection("PRÉFÉRENCES", [
          _settingItem(Icons.dark_mode_outlined, "Mode Sombre", Switch(value: false, onChanged: (v){})),
          _settingItem(Icons.language_rounded, "Langue", const Text("Français", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
        ]),
        const SizedBox(height: 32),
        _buildSection("SÉCURITÉ", [
          _settingItem(Icons.fingerprint_rounded, "Biométrie", Switch(value: true, onChanged: (v){})),
          _settingItem(Icons.lock_outline_rounded, "Changer le code", const Icon(Icons.chevron_right)),
        ]),
        const SizedBox(height: 40),
        ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade50, foregroundColor: Colors.red, elevation: 0, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text("Se déconnecter", style: TextStyle(fontWeight: FontWeight.bold))),
      ]),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
      const SizedBox(height: 16),
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.grey.shade100)), child: Column(children: items)),
    ]);
  }

  Widget _settingItem(IconData icon, String label, Widget action) {
    return ListTile(leading: Icon(icon, color: const Color(0xFF1A237E)), title: Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)), trailing: action);
  }
}
