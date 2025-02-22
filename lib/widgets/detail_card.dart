import 'package:flutter/material.dart';
import 'package:persona_duel/widgets/persona_card.dart';

class DetailCard extends StatelessWidget {
  Map<String, dynamic> data;
  DetailCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: Center(child: PersonaCard(imageUrl: data["image"])),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            data["name"] ?? "Unknown",
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
            "- ${data["arcana"]} -",
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
            "Level ${data["level"]} ",
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
              "\"${data['description']}\"",
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
                _buildStatRow("Strength", data["strength"]),
                _buildStatRow("Magic", data["magic"]),
                _buildStatRow("Endurance", data["endurance"]),
                _buildStatRow("Agility", data["agility"]),
                _buildStatRow("Luck", data["luck"]),
                _buildStatRow("Weak", data["weak"]),
                _buildStatRow("Resist", data["resists"]),
                _buildStatRow("Reflect", data["reflects"]),
                _buildStatRow("Absorbs", data["absorbs"]),
                _buildStatRow("Nullifies", data["nullifies"]),
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
