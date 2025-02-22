import 'package:flutter/material.dart';
import 'package:persona_duel/widgets/persona_card.dart';

class DetailCard extends StatelessWidget {
  Map<String, dynamic> state;
  DetailCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    // Jika state tidak ada, tampilkan pesan error
    print(state);
    if (state == null) {
      return const Center(
        child: Text(
          "No persona data available",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    }

    return ListView(
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: Center(child: PersonaCard(imageUrl: state["image"])),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            state["name"] ?? "Unknown",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white,
              shadows: [
                const Shadow(
                    blurRadius: 10, color: Colors.black, offset: Offset(3, 3)),
                Shadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.8),
                    offset: const Offset(6, 6)),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            "- ${state["arcana"]} -",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.normal,
              letterSpacing: 2,
              color: Colors.white,
              shadows: [
                const Shadow(
                    blurRadius: 10, color: Colors.black, offset: Offset(3, 3)),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            "Level ${state["level"]} ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal,
              letterSpacing: 2,
              color: Colors.white,
              shadows: [
                const Shadow(
                    blurRadius: 10, color: Colors.black, offset: Offset(3, 3)),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              "\"${state['description']}\"",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                letterSpacing: 2,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                shadows: [
                  const Shadow(
                      blurRadius: 10,
                      color: Colors.black,
                      offset: Offset(3, 3)),
                ],
              ),
            ),
          ),
        ),
        // Data Table for Stats
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: DataTable(
              border: TableBorder.all(color: Colors.white),
              columns: const [
                DataColumn(
                  label: Text(
                    "Stat",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Value",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              rows: [
                _buildStatRow("Strength", state["strength"]),
                _buildStatRow("Magic", state["magic"]),
                _buildStatRow("Endurance", state["endurance"]),
                _buildStatRow("Agility", state["agility"]),
                _buildStatRow("Luck", state["luck"]),
                _buildStatRow("Weak", state["weak"]),
                _buildStatRow("Resist", state["resists"]),
                _buildStatRow("Reflect", state["reflects"]),
                _buildStatRow("Absorbs", state["absorbs"]),
                _buildStatRow("Nullifies", state["nullifies"]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  DataRow _buildStatRow(String label, dynamic value) {
    return DataRow(
      cells: [
        DataCell(Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )),
        DataCell(Text(
          (value is List && value.isEmpty) ? "-" : value.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )),
      ],
    );
  }
}
