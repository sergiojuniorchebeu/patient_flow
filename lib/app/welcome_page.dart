import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gestpatient/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primaryContainer,
              colorScheme.background,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),

                // Logo / illustration
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24), // Légèrement moins que 32 pour respecter le padding
                    child: Image.asset(
                      "assets/img/illustration/illustration.jpeg",
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ).animate()
                    .fadeIn(duration: 800.ms)
                    .moveY(begin: 50),

                const SizedBox(height: 48),
                // Titre
                Text(
                  "PatientFlow",
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                    letterSpacing: -0.5,
                  ),
                ).animate()
                    .fadeIn(delay: 300.ms)
                    .moveY(begin: 30),

                const SizedBox(height: 16),

                // Sous-titre
                Text(
                  "Bienvenue sur votre assistant médical",
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ).animate()
                    .fadeIn(delay: 400.ms)
                    .moveY(begin: 20),

                const SizedBox(height: 24),

                // Description
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Gérez facilement vos patients, rendez-vous et consultations dans une interface moderne et intuitive",
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onBackground.withOpacity(0.7),
                      height: 1.5,
                    ),
                  ),
                ).animate()
                    .fadeIn(delay: 500.ms)
                    .moveY(begin: 20),

                const Spacer(flex: 2),

                // Fonctionnalités (externalisé)
                const CustomFeatureRow(
                  features: [
                    (icon: Icons.people_rounded, label: "Gestion patients"),
                    (icon: Icons.calendar_today_rounded, label: "Rendez-vous"),
                    (icon: Icons.medical_services_rounded, label: "Consultations"),
                  ],
                ).animate()
                    .fadeIn(delay: 600.ms)
                    .slideX(begin: 0.2),

                const SizedBox(height: 40),

                // Bouton principal (externalisé)
                PrimaryButton(
                  label: "Commencer maintenant",
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ).animate()
                    .fadeIn(delay: 700.ms),

                const SizedBox(height: 16),

                // Bouton secondaire (externalisé)
                SecondaryTextButton(
                  label: "Découvrir les fonctionnalités",
                  onPressed: () {
                    showFeatureDialog(context);
                  },
                ).animate()
                    .fadeIn(delay: 800.ms),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
