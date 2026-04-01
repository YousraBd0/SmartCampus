import 'package:flutter/material.dart';

// --- MODÈLES ---
class Announcement {
  final String id, title, summary, date, type;
  final String? fullText;
  final bool hasAttachment;
  final String? attachmentName;
  final String? attachmentSize;
  bool read;
  Announcement({
    required this.id,
    required this.title,
    required this.summary,
    required this.date,
    required this.type,
    this.fullText,
    this.hasAttachment = false,
    this.attachmentName,
    this.attachmentSize,
    this.read = false,
  });
}

class CampusEvent {
  final String id, title, date, time, location, type, description;
  CampusEvent({required this.id, required this.title, required this.date, required this.time, required this.location, required this.type, required this.description});
}

class ScheduleSession {
  final String id, subject, professor, startTime, endTime, room, day;
  ScheduleSession({required this.id, required this.subject, required this.professor, required this.startTime, required this.endTime, required this.room, required this.day});
}

// --- DONNÉES MOCK ---
final List<Announcement> mockAnnouncements = [
  Announcement(
    id: '1',
    title: 'Changement de salle - Mathématiques',
    summary: 'Le cours de Mathématiques de demain est déplacé.',
    fullText: 'Le cours de Mathématiques prévu demain à 10h est déplacé de la Salle 101 à la Salle 203 en raison de travaux de maintenance.',
    date: '31 MARS 2026',
    type: 'Académique',
    hasAttachment: true,
    attachmentName: 'Document_Joint.pdf',
    attachmentSize: '1.2 MB',
  ),
  Announcement(
    id: '2',
    title: 'Examen de Physique',
    summary: 'Détails sur l\'examen final de Physique.',
    date: '10 AVRIL 2026',
    type: 'Académique',
  ),
  Announcement(
    id: '3',
    title: 'Fermeture Bibliothèque',
    summary: 'La bibliothèque centrale sera fermée pour inventaire.',
    date: '5 AVRIL 2026',
    type: 'Administratif',
    read: true,
  ),
];

final List<CampusEvent> mockEvents = [
  CampusEvent(id: '1', title: 'Hackathon 2026', date: '15 Avr', time: '09:00', location: 'Amphi C', type: 'Tech', description: 'Compétition de 48h pour créer des solutions innovantes.'),
  CampusEvent(id: '2', title: 'Conférence IA', date: '18 Avr', time: '14:30', location: 'Bibliothèque Centrale', type: 'Conférence', description: 'L\'impact de l\'IA sur l\'éducation.'),
];

final List<ScheduleSession> mockSchedule = [
  ScheduleSession(id: '1', subject: 'Algorithmique', professor: 'Dr. Mansouri', startTime: '08:30', endTime: '10:00', room: 'Salle B12', day: 'Lundi'),
  ScheduleSession(id: '2', subject: 'Base de Données', professor: 'Mme. Belkaid', startTime: '10:15', endTime: '11:45', room: 'Labo 04', day: 'Lundi'),
];
