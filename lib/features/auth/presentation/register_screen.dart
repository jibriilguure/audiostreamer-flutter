import 'package:audio_streamer/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/const.dart';
import '../../audio/presentation/screens/audio_list_screen.dart';
import '../application/auth_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void handleRegister() async {
    // final email = emailController.text.trim();
    // final password = passwordController.text.trim();
    // final confirmPassword = confirmPasswordController.text.trim();

    // if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Please fill all fields")),
    //   );
    //   return;
    // }

    // if (password != confirmPassword) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Passwords do not match")),
    //   );
    //   return;
    // }

    // await ref.read(authControllerProvider.notifier).register(email, password);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (err, _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(err.toString())),
            );
          });
        },
        data: (response) {
          if (response.token.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Registration successful!")),
              );
              print(response.token);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
            });
          }
        },
      );
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              const Icon(Icons.music_note, size: 60, color: AppColors.primary),
              const SizedBox(height: 10),
              const Text(
                'Music World',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Join the Vibe',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColors.hint),
              ),
              const SizedBox(height: 40),

              // Email
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email or username',
                  labelStyle: const TextStyle(color: AppColors.hint),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.textFieldBorder),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: AppColors.hint),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.textFieldBorder),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: const Icon(Icons.lock, color: AppColors.hint),
                ),
              ),
              const SizedBox(height: 16),

              // Confirm password
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(color: AppColors.hint),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.textFieldBorder),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon:
                      const Icon(Icons.lock_outline, color: AppColors.hint),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: authState.isLoading ? null : handleRegister,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: authState.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Register',
                        style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 30),

              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Back to Login
                },
                child: const Text(
                  "Already have an account? SIGN IN",
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
