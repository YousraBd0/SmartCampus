import 'package:flutter/material.dart';
import '../models/models.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Événements", style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: mockEvents.length,
        itemBuilder: (context, index) {
          final event = mockEvents[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.grey.shade100)),
            child: Column(children: [
              ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(24)), child: Image.network('https://picsum.photos/seed/${event.id}/600/300', height: 150, width: double.infinity, fit: BoxFit.cover)),
              Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(event.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(children: [
                  const Icon(Icons.calendar_today, size: 14, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text(event.date, style: const TextStyle(fontSize: 12)),
                  const SizedBox(width: 16),
                  const Icon(Icons.location_on, size: 14, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text(event.location, style: const TextStyle(fontSize: 12)),
                ]),
              ])),
            ]),
          );
        },
      ),
    );
  }
}
