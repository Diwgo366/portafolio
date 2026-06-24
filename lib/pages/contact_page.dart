import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/fade_in_up.dart';
import '../widgets/page_layout.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(children: [
      const SizedBox(height: 24),
      FadeInUp(
        child: ContactCard(
          icon: Icons.email,
          label: 'Correo',
          value: 'diego.chancafe@unmsm.edu.pe',
          url: 'mailto:diego.chancafe@unmsm.edu.pe',
        ),
      ),
      const SizedBox(height: 12),
      FadeInUp(
        child: ContactCard(
          icon: Icons.link,
          label: 'LinkedIn',
          value: '/in/diegochancafe',
          url: 'https://www.linkedin.com/in/diegochancafe/',
        ),
      ),
    ]);
  }
}

class ContactCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final String url;

  const ContactCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Card(
        elevation: _hovering ? 6 : 2,
        child: ListTile(
          leading: Icon(widget.icon, color: Colors.deepPurple),
          title: Text(widget.label),
          subtitle: Text(widget.value),
          trailing: const Icon(Icons.open_in_new),
          onTap: () => launchUrl(Uri.parse(widget.url)),
        ),
      ),
    );
  }
}
