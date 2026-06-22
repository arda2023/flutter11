import 'package:flutter/material.dart';
import 'package:flutter11/medikamente.dart';

class MedsSearchBox extends StatefulWidget {
  const MedsSearchBox({
    super.key,
    required this.onDosisChanged,
    required this.onMedikamentChanged,
  });
  final ValueChanged<String?> onDosisChanged;
  final ValueChanged<String?> onMedikamentChanged;
  @override
  _MedsSearchBoxState createState() => _MedsSearchBoxState();
}

class _MedsSearchBoxState extends State<MedsSearchBox> {
  final SearchController _searchController = SearchController();
  String? _gewaehltesMedikament;
  List<String> _verfuegbareDosen = [];
  String? _gewaehlteDosis;
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          // Das if prüft: Haben wir überhaupt Dosis-Optionen zum Anzeigen?
          mainAxisSize: .min,
          children: [
            SearchAnchor(
              searchController: _searchController,
              builder: (context, controller) {
                return SearchBar(
                  controller: controller,
                  hintText: "Medikamente suchen...",
                  elevation: WidgetStateProperty.all(0),
                  backgroundColor: WidgetStateProperty.all(Colors.grey[100]),
                  leading: Icon(Icons.search, color: Colors.black54),
                  onTap: () {
                    controller.openView();
                  },
                );
              },
              suggestionsBuilder: (context, controller) {
                final String eingabe = controller.text.toLowerCase();
                final gefilterteMeds = adhsDatenbank.where((med) {
                  final String name = med["name"].toString().toLowerCase();
                  return name.contains(eingabe);
                }).toList();
                return gefilterteMeds.map((med) {
                  return ListTile(
                    title: Text(med["name"]),
                    onTap: () {
                      setState(() {
                        _searchController.closeView(med["name"]);
                        _gewaehltesMedikament = med["name"];
                        widget.onMedikamentChanged(med["name"]);
                        _verfuegbareDosen = List<String>.from(
                          med["dosierungen"],
                        );
                        _gewaehlteDosis = null;
                        widget.onDosisChanged(_gewaehlteDosis);
                      });
                    },
                  );
                }).toList();
              },
            ),
            if (_verfuegbareDosen.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Dosis wählen:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,

                children: _verfuegbareDosen.map((dosis) {
                  final bool istAktiv = _gewaehlteDosis == dosis;
                  return ChoiceChip(
                    showCheckmark: false,
                    label: Text(dosis),
                    selected: istAktiv,

                    backgroundColor: Colors.grey[300],
                    selectedColor: Colors.blue[300],
                    onSelected: (bool selected) {
                      setState(() {
                        _gewaehlteDosis = selected ? dosis : null;
                        widget.onDosisChanged(_gewaehlteDosis);
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
