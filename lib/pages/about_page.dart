import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/fade_in_up.dart';
import '../widgets/page_layout.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(children: [
      const SizedBox(height: 24),
      FadeInUp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Formación',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const _FormacionCard(
              icon: Icons.school,
              titulo: 'Universidad Nacional Mayor de San Marcos',
              subtitulo: 'Física - Área de Física Espacial y del Medio Ambiente',
              siteUrl: 'https://unmsm.edu.pe',
            ),
          ],
        ),
      ),
      const SizedBox(height: 24),
      FadeInUp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Herramientas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildToolCategory('Aula Virtual', [
              _Tool('assets/icons/googleclassroom.png', 'Classroom', isAsset: true, siteUrl: 'https://classroom.google.com'),
              _Tool('', 'Blackboard', fallbackIcon: Icons.school, siteUrl: 'https://www.blackboard.com'),
            ]),
            const SizedBox(height: 16),
            _buildToolCategory('Evaluación', [
              _Tool('assets/icons/kahoot.png', 'Kahoot', isAsset: true, siteUrl: 'https://kahoot.com'),
              _Tool('assets/icons/quizizz.png', 'Quizizz', isAsset: true, fallbackIcon: Icons.quiz, siteUrl: 'https://quizizz.com'),
              _Tool('assets/icons/googleforms.png', 'Google Forms', isAsset: true, siteUrl: 'https://forms.google.com'),
            ]),
            const SizedBox(height: 16),
            _buildToolCategory('Contenido', [
              _Tool('assets/icons/canva.png', 'Canva', isAsset: true, siteUrl: 'https://www.canva.com'),
              _Tool('assets/icons/microsoft-powerpoint.png', 'PowerPoint', isAsset: true, siteUrl: 'https://www.microsoft.com/microsoft-365/powerpoint'),
              _Tool('assets/icons/prezi.png', 'Prezi', isAsset: true, siteUrl: 'https://prezi.com'),
            ]),
            const SizedBox(height: 16),
            _buildToolCategory('Comunicación', [
              _Tool('assets/icons/zoom.png', 'Zoom', isAsset: true, siteUrl: 'https://zoom.us'),
              _Tool('assets/icons/googlemeet.png', 'Google Meet', isAsset: true, siteUrl: 'https://meet.google.com'),
              _Tool('assets/icons/microsoft-teams.png', 'MS Teams', isAsset: true, siteUrl: 'https://teams.microsoft.com'),
            ]),
            const SizedBox(height: 16),
            _buildToolCategory('Simuladores', [
              _Tool('', 'PhET', fallbackIcon: Icons.science, siteUrl: 'https://phet.colorado.edu'),
              _Tool('', 'GeoGebra', fallbackIcon: Icons.auto_stories, siteUrl: 'https://www.geogebra.org'),
            ]),
          ],
        ),
      ),
      const SizedBox(height: 24),
      FadeInUp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Reflexión Pedagógica',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const _ReflexionCard(),
          ],
        ),
      ),
    ]);
  }

  Widget _buildToolCategory(String titulo, List<_Tool> tools) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.deepPurple)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: tools.map((t) => _ToolChip(tool: t)).toList(),
        ),
      ],
    );
  }
}

class _ToolChip extends StatefulWidget {
  final _Tool tool;
  const _ToolChip({required this.tool});

  @override
  State<_ToolChip> createState() => _ToolChipState();
}

class _ToolChipState extends State<_ToolChip> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final hasUrl = widget.tool.siteUrl != null;
    return MouseRegion(
      cursor: hasUrl ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: hasUrl ? (_) => setState(() => _hovering = true) : null,
      onExit: hasUrl ? (_) => setState(() => _hovering = false) : null,
      child: Card(
        elevation: _hovering ? 6 : 2,
        child: InkWell(
          onTap: hasUrl ? () => launchUrl(Uri.parse(widget.tool.siteUrl!), mode: LaunchMode.externalApplication) : null,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.tool.buildIcon(),
                const SizedBox(height: 6),
                Text(
                  widget.tool.nombre,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormacionCard extends StatefulWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final String? siteUrl;

  const _FormacionCard({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    this.siteUrl,
  });

  @override
  State<_FormacionCard> createState() => _FormacionCardState();
}

class _FormacionCardState extends State<_FormacionCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final hasUrl = widget.siteUrl != null;
    return MouseRegion(
      cursor: hasUrl ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: hasUrl ? (_) => setState(() => _hovering = true) : null,
      onExit: hasUrl ? (_) => setState(() => _hovering = false) : null,
      child: Card(
        elevation: _hovering ? 6 : 2,
        child: InkWell(
          onTap: hasUrl ? () => launchUrl(Uri.parse(widget.siteUrl!), mode: LaunchMode.externalApplication) : null,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(widget.icon, size: 36, color: Colors.deepPurple),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.titulo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text(widget.subtitulo, style: const TextStyle(fontSize: 14, color: Colors.grey)),
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

class _ReflexionCard extends StatefulWidget {
  const _ReflexionCard();

  @override
  State<_ReflexionCard> createState() => _ReflexionCardState();
}

class _ReflexionCardState extends State<_ReflexionCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Card(
        elevation: _hovering ? 6 : 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: const Text(
            'La enseñanza no es solo transmisión de información, '
            'sino un proceso de diálogo en el que docente y estudiante '
            'construyen conocimiento juntos. El pensamiento crítico, '
            'la pregunta constante y la capacidad de cuestionar '
            'lo establecido son los motores del aprendizaje significativo.',
            style: TextStyle(fontSize: 15, height: 1.6, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}

class _Tool {
  final String url;
  final String nombre;
  final bool isAsset;
  final IconData? fallbackIcon;
  final String? siteUrl;

  const _Tool(this.url, this.nombre, {this.isAsset = false, this.fallbackIcon, this.siteUrl});

  Widget buildIcon() {
    if (isAsset) {
      return Image.asset(
        url,
        width: 48,
        height: 48,
        errorBuilder: (_, _, _) {
          if (fallbackIcon != null) {
            return Icon(fallbackIcon!, size: 48, color: Colors.deepPurple);
          }
          return const SizedBox(width: 48, height: 48);
        },
      );
    }
    return Image.network(
      url,
      width: 48,
      height: 48,
      errorBuilder: (_, _, _) {
        if (fallbackIcon != null) {
          return Icon(fallbackIcon!, size: 48, color: Colors.deepPurple);
        }
        return const SizedBox(width: 48, height: 48);
      },
    );
  }
}
