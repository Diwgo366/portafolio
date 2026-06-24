import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/fade_in_up.dart';
import '../widgets/page_layout.dart';

class ResearchPage extends StatelessWidget {
  const ResearchPage({super.key});

  static const _proyectos = [
    _Proyecto(
      Icons.school,
      'Perfil Docente Actual',
      'Análisis del rol y competencias docentes requeridas hoy.',
      url: 'pdfs/Perfil.pdf',
    ),
    _Proyecto(
      Icons.flip_to_back,
      'Aula Invertida — MRU',
      'Secuencia didáctica Flipped Classroom para enseñar MRU.',
      url: 'pdfs/flipped-class-mru.pdf',
    ),
    _Proyecto(
      Icons.account_balance,
      'ABC — Resonancia: Puente que oscilaba',
      'Estudio de caso sobre resonancia mecánica en puente real.',
      url: 'pdfs/abc.pdf',
    ),
    _Proyecto(
      Icons.event,
      'Cronograma de Asesorías',
      'Planificación semanal de tutorías para estudiantes de Física.',
      url: 'pdfs/Cronograma.pdf',
    ),
    _Proyecto(
      Icons.mic,
      'Divulgación Científica',
      'Artículos de física para público general.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageLayout(children: [
      const SizedBox(height: 8),
      ...List.generate(_proyectos.length, (i) {
        final p = _proyectos[i];
        return FadeInUp(
          child: Padding(
            padding: EdgeInsets.only(bottom: i < _proyectos.length - 1 ? 16 : 0),
            child: _ProyectoCard(p),
          ),
        );
      }),
    ]);
  }
}

class _Proyecto {
  final IconData icon;
  final String titulo;
  final String descripcion;
  final String? url;
  const _Proyecto(this.icon, this.titulo, this.descripcion, {this.url});
}

class _ProyectoCard extends StatefulWidget {
  final _Proyecto proyecto;
  const _ProyectoCard(this.proyecto);

  @override
  State<_ProyectoCard> createState() => _ProyectoCardState();
}

class _ProyectoCardState extends State<_ProyectoCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final hasUrl = widget.proyecto.url != null;
    return MouseRegion(
      cursor: hasUrl ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: hasUrl ? (_) => setState(() => _hovering = true) : null,
      onExit: hasUrl ? (_) => setState(() => _hovering = false) : null,
      child: Card(
        elevation: _hovering ? 6 : 2,
        child: InkWell(
          onTap: hasUrl ? () => launchUrl(Uri.parse(widget.proyecto.url!)) : null,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(widget.proyecto.icon, size: 36, color: Colors.deepPurple),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.proyecto.titulo,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.proyecto.descripcion,
                        style: const TextStyle(fontSize: 15, height: 1.4),
                      ),
                    ],
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
