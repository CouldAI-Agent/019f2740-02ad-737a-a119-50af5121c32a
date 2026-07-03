import 'package:flutter/material.dart';

void main() {
  runApp(const TelecallerApp());
}

class TelecallerApp extends StatelessWidget {
  const TelecallerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elastic Call Script',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005571), // Elastic blue-ish tone
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ScriptScreen(),
      },
    );
  }
}

class ScriptScreen extends StatefulWidget {
  const ScriptScreen({super.key});

  @override
  State<ScriptScreen> createState() => _ScriptScreenState();
}

class _ScriptScreenState extends State<ScriptScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isInterested = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agentic AI Day – Calling Script'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 800;
            
            if (isMobile) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildScriptSection(),
                    const SizedBox(height: 24),
                    _buildDataEntrySection(),
                  ],
                ),
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: _buildScriptSection(),
                  ),
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: _buildDataEntrySection(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildScriptSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionCard(
          '1. Greeting & Pitch',
          [
            'Hi, this is [Agent Name] calling on behalf of Elastic.',
            'Am I speaking with [First Name]?',
            'I\'m calling to personally invite you to Elastic Agentic AI Day – Bangalore, an exclusive in-person event bringing together IT leaders, architects, developers, AI practitioners, and security professionals to explore the latest innovations in Agentic AI, enterprise search, observability, and security.',
            'The event will feature expert-led sessions, hands-on workshops, and networking opportunities with Elastic experts and industry peers.',
          ],
        ),
        const SizedBox(height: 16),
        _buildEventDetailsCard(),
        const SizedBox(height: 16),
        _buildSectionCard(
          '3. Key Highlights',
          [
            'At the event, attendees will get a chance to:',
            '• Explore the latest innovations in Agentic AI and Enterprise Search.',
            '• Learn about Agent Builder, Agentic RAG, and AI-powered workflows.',
            '• Discover AI-powered Observability and Autonomous Security Operations.',
            '• Participate in hands-on workshops, live demos, and networking with Elastic experts.',
          ],
        ),
        const SizedBox(height: 16),
        _buildSectionCard(
          '4. Closing (If Interested)',
          [
            'Client: Yes, it sounds interesting.',
            'Agent: That\'s great to hear. I\'d be happy to assist you with the registration.',
            'May I please confirm your official email address, company name, and job title?',
            '[Capture details in the form pane]',
            'Thank you. I\'ll complete your registration, and you\'ll receive a confirmation email along with the event details shortly.',
            'Thank you for your time. We would be delighted to have you join us at Elastic Agentic AI Day – Bangalore on 13 August 2026. We look forward to welcoming you to The Leela Palace, Bangalore. Have a great day!',
          ],
        ),
      ],
    );
  }

  Widget _buildSectionCard(String title, List<String> texts) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            ...texts.map((text) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDetailsCard() {
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2. Event Details',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            _detailRow(Icons.calendar_today, 'Event Date:', '13 August 2026'),
            _detailRow(Icons.access_time, 'Time:', '9:00 AM – 4:00 PM'),
            _detailRow(Icons.location_on, 'Venue:', 'Royal Ballroom, The Leela Palace, Bangalore'),
            _detailRow(Icons.people, 'Mode:', 'In-Person'),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataEntrySection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Client Registration',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              const Text('Capture details if the client is interested.'),
              const SizedBox(height: 24),
              SwitchListTile(
                title: const Text('Client is Interested?'),
                value: _isInterested,
                onChanged: (val) {
                  setState(() {
                    _isInterested = val;
                  });
                },
              ),
              const Divider(),
              if (_isInterested) ...[
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Official Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.business),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Job Title',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.work),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registration Captured Successfully!')),
                      );
                    },
                    icon: const Icon(Icons.check_circle),
                    label: const Text('Complete Registration', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ] else ...[
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Call Ended. No registration.')),
                      );
                    },
                    icon: const Icon(Icons.call_end),
                    label: const Text('End Call', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
