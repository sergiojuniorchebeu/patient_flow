import 'package:flutter/material.dart';

void showFeatureDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Fonctionnalités de PatientFlow"),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.people_rounded, color: Color(0xFF2E7D32)),
            title: Text("Gestion des patients"),
            subtitle: Text("Dossiers médicaux complets"),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_rounded, color: Color(0xFF2E7D32)),
            title: Text("Planning"),
            subtitle: Text("Rendez-vous et rappels"),
          ),
          ListTile(
            leading: Icon(Icons.medical_services_rounded, color: Color(0xFF2E7D32)),
            title: Text("Consultations"),
            subtitle: Text("Suivi des traitements"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Fermer"),
        ),
      ],
    ),
  );
}
