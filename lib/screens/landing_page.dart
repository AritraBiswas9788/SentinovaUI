
import 'package:flutter/material.dart';
import '../dataclass/event_model.dart';
import '../services/api_service_events.dart';
import 'event_pass_gate.dart';



class LandingPage extends StatelessWidget {
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Events")),
      body: FutureBuilder<Events>(
        future: api.fetchEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());

          if (snapshot.hasError)
            return Center(child: Text("Error: ${snapshot.error}"));

          if (!snapshot.hasData || snapshot.data!.events.isEmpty)
            return Center(child: Text("No events available"));

          final events = snapshot.data!.events;

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(event.name ?? 'Unnamed Event'),
                  subtitle: Text("Location: ${event.location ?? 'Unknown'}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EventPasswordGate(event: event),
                      ),
                    );// Navigate to a details page, passing the full `event` object
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
