import 'package:bookedge/widget/log/forgot_password.dart';
import 'package:bookedge/screen/reservas_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHidden = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                const SizedBox(height: 40),
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'sans-serif',
                  ),
                ),
                const SizedBox(height: 30),
                ClipOval(
                  child: Image.network(
                    'https://instagram.feoh1-1.fna.fbcdn.net/v/t39.30808-6/412902863_18401181055036615_2565695662900103803_n.jpg?stp=dst-jpg_e35_s240x240&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDgxMC5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ&_nc_ht=instagram.feoh1-1.fna.fbcdn.net&_nc_cat=107&_nc_ohc=vCSLC4VIZ78Q7kNvgGS70CF&_nc_gid=5f2fb813a3224633882d3116da4c63b0&edm=APoiHPcAAAAA&ccb=7-5&ig_cache_key=MzI2MjgzMTAzMTU1MjA0MzEwMQ%3D%3D.3-ccb7-5&oh=00_AYBj_tOZZg12DPSGVrb7zhK7I9ZPrRIt8jZbsn4_-AeU4Q&oe=6753F47E&_nc_sid=22de04',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 40),
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
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: isHidden,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isHidden ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          // Aquí puedes agregar la lógica para restablecer la contraseña
                          Navigator.push(
                              context,
                              //MaterialPage Route se utiliza para navegar entre pantallas
                              MaterialPageRoute(
                                //
                                builder: (context) => const ForgotPassword(),
                              ));
                        },
                        child: const Text(
                          'Olvide mi contraseña',
                          style: TextStyle(color: Colors.blue),
                        ))),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor complete los campos'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReservasScreen()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login exitoso')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
