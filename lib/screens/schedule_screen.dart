import 'package:flutter/material.dart';
import '../models/models.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String selectedDay = "Lundi";
  final List<String> days = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Emploi du temps", style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: Colors.white),
      body: Column(children: [
        _buildDaySelector(),
        Expanded(child: _buildScheduleList()),
      ]),
    );
  }

  Widget _buildDaySelector() {
    return SizedBox(height: 60, child: ListView.builder(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), itemCount: days.length, itemBuilder: (context, index) {
      bool active = days[index] == selectedDay;
      return GestureDetector(
        onTap: () => setState(() => selectedDay = days[index]),
        child: Container(margin: const EdgeInsets.all(8), padding: const EdgeInsets.symmetric(horizontal: 20), decoration: BoxDecoration(color: active ? const Color(0xFF1A237E) : Colors.grey.shade100, borderRadius: BorderRadius.circular(12)), alignment: Alignment.center, child: Text(days[index], style: TextStyle(color: active ? Colors.white : Colors.grey, fontWeight: FontWeight.bold, fontSize: 12))),
      );
    }));
  }

  Widget _buildScheduleList() {
    return ListView.builder(padding: const EdgeInsets.all(24), itemCount: mockSchedule.length, itemBuilder: (context, index) {
      final session = mockSchedule[index];
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(children: [
          Text(session.startTime, style: const TextStyle(fontWeight: FontWeight.bold)),
          Container(width: 2, height: 60, color: Colors.grey.shade200, margin: const EdgeInsets.symmetric(vertical: 8)),
          Text(session.endTime, style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
        ]),
        const SizedBox(width: 20),
        Expanded(child: Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.grey.shade100)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(session.subject, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(session.professor, style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
          const SizedBox(height: 12),
          Text(session.room, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
        ]))),
      ]);
    });
  }
}
