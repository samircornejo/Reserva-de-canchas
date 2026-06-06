import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Detectamos el ancho de la pantalla para ajustar tamaños de texto y layouts
    final double urlWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = urlWidth > 800;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // Un fondo con un sutil degradado que evoca el césped de las canchas
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8F5E9), Color(0xFFFFFFFF)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Cabecera / Logo
                    Icon(Icons.sports_soccer, size: isDesktop ? 100 : 70, color: Colors.green[700]),
                    const SizedBox(height: 16),
                    Text(
                      'RESERVA TU CANCHA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isDesktop ? 40 : 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.green[800],
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'La plataforma ideal para gestionar tus partidos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isDesktop ? 18 : 15,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 50),

                    // Sección de Beneficios / Características
                    Flex(
                      direction: isDesktop ? Axis.horizontal : Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildFeatureItem(Icons.bolt, 'Reserva al Instante', 'Separa tu horario en menos de un minuto.'),
                        SizedBox(height: isDesktop ? 0 : 24, width: isDesktop ? 24 : 0),
                        _buildFeatureItem(Icons.schedule, 'Horarios Flexibles', 'Visualiza la disponibilidad de las canchas en tiempo real.'),
                        SizedBox(height: isDesktop ? 0 : 24, width: isDesktop ? 24 : 0),
                        _buildFeatureItem(Icons.star, 'Canchas Premium', 'Encuentra las mejores instalaciones de la zona.'),
                      ],
                    ),
                    const SizedBox(height: 60),

                    // Botón Principal de Acceso
                    ElevatedButton(
                      onPressed: () {
                        // Por ahora mandará un mensaje, luego configuraremos la navegación
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Redireccionando al panel de control...')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 50 : 40,
                          vertical: isDesktop ? 20 : 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        'INGRESAR AL SISTEMA',
                        style: TextStyle(
                          fontSize: isDesktop ? 18 : 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para construir las tarjetitas de características de forma limpia
  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BorderRadius.circular(16).asCardDecoration(),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green[50],
            radius: 28,
            child: Icon(icon, color: Colors.green[700], size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// Extensión rápida para simular un estilo de tarjeta sin meter más widgets anidados
extension on BorderRadius {
  BoxDecoration asCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: this,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}