import 'package:flutter/material.dart';

void main() {
  runApp(const InvestechApp());
}

class InvestechApp extends StatelessWidget {
  const InvestechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto', // O la fuente predeterminada limpia
      ),
      home: const InvestechDashboard(),
    );
  }
}

class InvestechDashboard extends StatelessWidget {
  const InvestechDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Fondo gris "nube" muy sutil
      appBar: AppBar(
        title: const Text(
          "INVESTECH",
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.w800, 
            letterSpacing: 1.2,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF0D1B2A), // Azul noche profundo (más empresarial)
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: const [
          InvestechCard(
            imageUrl: "https://raw.githubusercontent.com/RubenMendozaCastrejon/Imagenes-Exam/refs/heads/main/Act2/Perfil.png", 
            title: "Usuario",
            subtitle: "Edu4rdSHL",
          ),
          InvestechCard(
            imageUrl: "https://raw.githubusercontent.com/RubenMendozaCastrejon/Imagenes-Exam/refs/heads/main/Act2/Bitcoin.jpg",
            title: "Activo Digital",
            subtitle: "Bitcoin (BTC)",
          ),
          InvestechCard(
            imageUrl: "https://raw.githubusercontent.com/RubenMendozaCastrejon/Imagenes-Exam/refs/heads/main/Act2/Rendimiento.jpg",
            title: "Rendimiento Anual",
            subtitle: "12.5% Estimado",
          ),
          InvestechCard(
            imageUrl: "https://raw.githubusercontent.com/RubenMendozaCastrejon/Imagenes-Exam/refs/heads/main/Act2/Portafolio.jpg",
            title: "Estrategia",
            subtitle: "Portafolio Global",
          ),
          InvestechCard(
            imageUrl: "https://raw.githubusercontent.com/RubenMendozaCastrejon/Imagenes-Exam/refs/heads/main/Act2/Oro.jpg",
            title: "Reserva de Valor",
            subtitle: "Oro Físico",
          ),
        ],
      ),
    );
  }
}

class InvestechCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const InvestechCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Imagen con bordes redondeados internos
            Padding(
              padding: const EdgeInsets.all(10.0), // Padding para que respire
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            // Textos
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 12, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.5,
                        color: Colors.blueGrey[400],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B263B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Indicador minimalista al final
            const Icon(Icons.chevron_right, color: Color(0xFFE0E0E0)),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}