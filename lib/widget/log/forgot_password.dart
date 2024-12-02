// En forgot_password.dart
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón de retroceso
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 20),
                // Título
                const Text(
                  'Recuperar Contraseña',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'sans-serif',
                  ),
                ),
                const SizedBox(height: 30),
                // Logo
                Image.network(
                  'https://st2.depositphotos.com/1768926/9200/v/450/depositphotos_92004024-stock-illustration-stylized-lotus-flower-icon-vector.jpg',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 40),
                // Texto informativo
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Ingresa tu correo electrónico y te enviaremos las instrucciones para recuperar tu contraseña.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                // Campo de email
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(Icons.email),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 40),
                // Botón de enviar
                ElevatedButton(
                  onPressed: () {
                    if (_emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor ingresa tu email'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      // Aquí iría la lógica para enviar el email
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Se han enviado las instrucciones a tu email'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      // Volvemos a la pantalla anterior después de un breve delay
                      // Future.delayed(const Duration(seconds: 2), () {
                      //   Navigator.pop(context);
                      // });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 150),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Enviar Correo'),
                ),
                const SizedBox(height: 20),
                // Botón para volver al login
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Volver al Login',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}