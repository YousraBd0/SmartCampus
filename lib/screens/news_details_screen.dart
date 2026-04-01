import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import '../models/models.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Announcement announcement;

  const NewsDetailsScreen({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80,
        leading: Center(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9), // Light grey
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(CupertinoIcons.chevron_left, color: Color(0xFF0F1A4A), size: 20),
            ),
          ),
        ),
        title: Text(
          "Détails de l'annonce",
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: const Color(0xFF0F1A4A),
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- PILL CATEGORY ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EAF6), // Light blue background
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                announcement.type.toUpperCase(),
                style: GoogleFonts.nunito(
                  color: const Color(0xFF141F59),
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- TITLE ---
            Text(
              announcement.title,
              style: GoogleFonts.nunito(
                fontSize: 28,
                height: 1.2,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF0F1A4A),
              ),
            ),
            const SizedBox(height: 16),

            // --- DATE ---
            Text(
              announcement.date,
              style: GoogleFonts.nunito(
                color: const Color(0xFF94A3B8), // slate-400
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 32),

            // --- FULL TEXT ---
            Text(
              announcement.fullText ?? announcement.summary,
              style: GoogleFonts.nunito(
                color: const Color(0xFF475569), // slate-600
                fontSize: 17,
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 40),

            // --- ATTACHMENT CARD ---
            if (announcement.hasAttachment)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade200, // Ideally a dashed border, simulating with solid here
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9), // Light grey
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(CupertinoIcons.doc_text, color: Color(0xFF94A3B8), size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            announcement.attachmentName ?? "Document",
                            style: GoogleFonts.nunito(
                              color: const Color(0xFF0F1A4A),
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            announcement.attachmentSize ?? "Unknown size",
                            style: GoogleFonts.nunito(
                              color: const Color(0xFF94A3B8), // slate-400
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(CupertinoIcons.arrow_down_to_line, color: Color(0xFF141F59), size: 28),
                  ],
                ),
              ),

            const SizedBox(height: 40),

            // --- BUTTON: MARK AS READ ---
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A237E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                  shadowColor: const Color(0xFF1A237E).withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.check_mark_circled, color: Colors.white, size: 22),
                    const SizedBox(width: 8),
                    Text(
                      "Marquer comme lu",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
