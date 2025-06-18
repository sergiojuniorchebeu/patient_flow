import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gestpatient/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simuler une requête de connexion
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Navigation vers le dashboard
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primaryContainer,
              colorScheme.background,
              colorScheme.primaryContainer.withOpacity(0.3),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),

                  // Bouton retour
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: colorScheme.primary,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: colorScheme.surface,
                          padding: const EdgeInsets.all(12),
                        ),
                      ),
                    ],
                  ).animate().fadeIn().slideX(begin: -0.3),

                  const SizedBox(height: 40),

                  // Logo et titre
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.primary.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.local_hospital_rounded,
                          size: 60,
                          color: colorScheme.primary,
                        ),
                      ).animate()
                          .fadeIn(duration: 600.ms),

                      const SizedBox(height: 24),

                      Text(
                        "Bon retour !",
                        style: textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ).animate()
                          .fadeIn(delay: 200.ms)
                          .moveY(begin: 20),

                      const SizedBox(height: 8),

                      Text(
                        "Connectez-vous à votre compte PatientFlow",
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onBackground.withOpacity(0.7),
                        ),
                      ).animate()
                          .fadeIn(delay: 300.ms)
                          .moveY(begin: 20),
                    ],
                  ),

                  const SizedBox(height: 48),

                  // Formulaire de connexion
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Champ email
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "votre@email.com",
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: colorScheme.primary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: colorScheme.outline.withOpacity(0.3),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: colorScheme.primary,
                                  width: 2,
                                ),
                              ),
                              filled: true,
                              fillColor: colorScheme.primaryContainer.withOpacity(0.3),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir votre email';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                return 'Veuillez saisir un email valide';
                              }
                              return null;
                            },
                          ).animate()
                              .fadeIn(delay: 400.ms)
                              .slideX(begin: 0.2),

                          const SizedBox(height: 20),

                          // Champ mot de passe
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: "Mot de passe",
                              hintText: "••••••••",
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: colorScheme.primary,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: colorScheme.primary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: colorScheme.outline.withOpacity(0.3),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: colorScheme.primary,
                                  width: 2,
                                ),
                              ),
                              filled: true,
                              fillColor: colorScheme.primaryContainer.withOpacity(0.3),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir votre mot de passe';
                              }
                              if (value.length < 6) {
                                return 'Le mot de passe doit contenir au moins 6 caractères';
                              }
                              return null;
                            },
                          ).animate()
                              .fadeIn(delay: 500.ms)
                              .slideX(begin: 0.2),

                          const SizedBox(height: 16),

                          // Se souvenir de moi et mot de passe oublié
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                                activeColor: colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _showForgotPasswordDialog();
                                },
                                child: Text(
                                  "Mot de passe oublié ?",
                                  style: TextStyle(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ).animate()
                              .fadeIn(delay: 600.ms),

                          const SizedBox(height: 24),

                          // Bouton de connexion
                          SizedBox(
                            height: 56,
                            child: PrimaryButton(
                              label: "Se connecter",
                              onPressed: _handleLogin,
                            ),
                          ).animate()
                              .fadeIn(delay: 700.ms)
                              ,
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: colorScheme.outline.withOpacity(0.3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "ou",
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onBackground.withOpacity(0.6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: colorScheme.outline.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ).animate()
                      .fadeIn(delay: 800.ms),

                  const SizedBox(height: 24),

                  // Boutons de connexion sociale
                  Row(
                    children: [
                      Expanded(
                        child: _buildSocialButton(
                          context,
                          Icons.g_mobiledata_rounded,
                          "Google",
                              () {
                            // Implémentation connexion Google
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildSocialButton(
                          context,
                          Icons.apple,
                          "Apple",
                              () {
                            // Implémentation connexion Apple
                          },
                        ),
                      ),
                    ],
                  ).animate()
                      .fadeIn(delay: 900.ms)
                      .slideY(begin: 0.3),

                  const SizedBox(height: 32),

                  // Lien vers inscription
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pas encore de compte ? ",
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onBackground.withOpacity(0.7),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ).animate()
                      .fadeIn(delay: 1000.ms),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      BuildContext context,
      IconData icon,
      String label,
      VoidCallback onPressed,
      ) {
    final colorScheme = Theme.of(context).colorScheme;

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: colorScheme.onSurface,
        size: 20,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.3),
        ),
        backgroundColor: colorScheme.surface,
      ),
    );
  }

  void _showForgotPasswordDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Icon(
              Icons.lock_reset_rounded,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 8),
            const Text("Mot de passe oublié"),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Saisissez votre adresse email pour recevoir un lien de réinitialisation.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "votre@email.com",
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: colorScheme.primary,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Annuler"),
          ),
          ElevatedButton(
            onPressed: () {
              // Logique d'envoi de l'email de réinitialisation
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Email de réinitialisation envoyé !"),
                  backgroundColor: colorScheme.primary,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
            child: const Text("Envoyer"),
          ),
        ],
      ),
    );
  }
}