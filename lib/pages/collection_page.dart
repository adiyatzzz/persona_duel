import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persona_duel/bloc/personas_bloc.dart';
import 'package:persona_duel/widgets/my_appbar.dart';
import 'package:persona_duel/widgets/my_bottom_navbar.dart';
import 'package:persona_duel/widgets/persona_card.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController _scrollController =
      ScrollController(); // Tambahkan ScrollController
  double _scrollOffset = 0.0; // Simpan posisi scroll
  String _selectedFilter = "Default";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Dengarkan perubahan tab untuk menyimpan & mengembalikan posisi scroll
    _tabController!.addListener(() {
      if (_tabController!.index == 0) {
        // Kembali ke Collection, kembalikan posisi scroll
        Future.delayed(Duration(milliseconds: 100), () {
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(_scrollOffset);
          }
        });
      } else {
        // Saat berpindah tab lain, simpan posisi scroll
        if (_scrollController.hasClients) {
          _scrollOffset = _scrollController.offset;
        }
      }
    });
  }

  void _updateFilter(String newFilter) {
    setState(() {
      _selectedFilter = newFilter;
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
          titlePage: "Persona Collection", tabController: _tabController),
      body: TabBarView(
        controller: _tabController,
        children: [
          _BuildCollection(
            scrollController: _scrollController,
            selectedFilter: _selectedFilter,
            onFilterSelected: this._updateFilter,
          ), // Pass controller ke Collection
          Center(child: Text("My Persona Page")), // Halaman My Persona
          Center(child: Text("Skill Page")), // Halaman Skill
        ],
      ),
      bottomNavigationBar: MyBottomNavbar(selectedIndex: 0),
    );
  }
}

class _BuildCollection extends StatelessWidget {
  final ScrollController scrollController;
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const _BuildCollection({
    super.key,
    required this.scrollController,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            _filterOption(context, "Default"),
            _filterOption(context, "Name A-Z"),
            _filterOption(context, "Name Z-A"),
            _filterOption(context, "Arcana A-Z"),
            _filterOption(context, "Arcana Z-A"),
            _filterOption(context, "Level Low-High"),
            _filterOption(context, "Level High-Low"),
          ],
        );
      },
    );
  }

  Widget _filterOption(BuildContext context, String filterName) {
    return ListTile(
      title: Text(filterName),
      onTap: () {
        onFilterSelected(filterName);
        Navigator.pop(context);
      },
    );
  }

  List<Map<String, dynamic>> _applySorting(
      List<Map<String, dynamic>> personas) {
    List<Map<String, dynamic>> sortedList = List.from(personas);

    switch (selectedFilter) {
      case "Name A-Z":
        sortedList.sort((a, b) => (a['name'] ?? "").compareTo(b['name'] ?? ""));
        break;
      case "Name Z-A":
        sortedList.sort((a, b) => (b['name'] ?? "").compareTo(a['name'] ?? ""));
        break;
      case "Arcana A-Z":
        sortedList
            .sort((a, b) => (a['arcana'] ?? "").compareTo(b['arcana'] ?? ""));
        break;
      case "Arcana Z-A":
        sortedList
            .sort((a, b) => (b['arcana'] ?? "").compareTo(a['arcana'] ?? ""));
        break;
      case "Level Low-High":
        sortedList.sort((a, b) => (a['level'] ?? 0).compareTo(b['level'] ?? 0));
        break;
      case "Level High-Low":
        sortedList.sort((a, b) => (b['level'] ?? 0).compareTo(a['level'] ?? 0));
        break;
      default:
        break;
    }
    return sortedList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonasBloc, List<Map<String, dynamic>>>(
      builder: (context, state) {
        List<Map<String, dynamic>> filteredList = _applySorting(state);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter: $selectedFilter",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list,
                        size: 28, color: Colors.white), // Warna ikon putih
                    onPressed: () => _showFilterOptions(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/detail",
                            arguments: filteredList[index]);
                      },
                      child: Stack(children: [
                        PersonaCard(imageUrl: filteredList[index]['image']),
                        Align(
                          alignment: Alignment(0, 0.85),
                          child: LayoutBuilder(
                            builder: (context, constraints) => Container(
                                width: constraints.maxWidth * 0.85,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    filteredList[index]['name'] ?? "Unknown",
                                    textAlign: TextAlign.center,
                                    maxLines:
                                        1, // Agar teks tidak lebih dari 1 baris
                                    minFontSize: 12, // Ukuran font minimum
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      color: Colors.white,
                                      shadows: [
                                        const Shadow(
                                            blurRadius: 10,
                                            color: Colors.black,
                                            offset: Offset(3, 3)),
                                        Shadow(
                                            blurRadius: 20,
                                            color: Color.fromARGB(
                                                127, 255, 197, 74),
                                            offset: const Offset(3, 3)),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.7, -0.8),
                          child: Text(
                            filteredList[index]['level'].toString() ??
                                "Unknown",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: Colors.white,
                              shadows: [
                                const Shadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    offset: Offset(3, 3)),
                                Shadow(
                                    blurRadius: 20,
                                    color: Colors.black,
                                    offset: const Offset(3, 3)),
                              ],
                            ),
                          ),
                        )
                      ]),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
