import 'package:flutter/material.dart';
import 'package:flutter11/models/Medeintrag.dart';
import 'package:flutter11/widgets/meds_search_box.dart';

class FabOpened extends StatefulWidget {
  const FabOpened({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<FabOpened> createState() => _FabOpenedState();
}

class _FabOpenedState extends State<FabOpened> {
  bool _buttonGezeigt = false;
  String? _gewaehltesMedikamentInSheet;
  String? _gewaehlteDosisInSheet;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 238, 238, 238),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        // Wir nutzen ein SingleChildScrollView, damit das DraggableScrollableSheet
        // sauber mit scrollController arbeiten kann, falls die Tastatur aufklappt.
        child: Column(
          // mainAxisSize.min sagt der Column: Sei nur so hoch wie deine Kinder!
          children: [
            const SizedBox(height: 12),
            // Visueller Handle zum Runterziehen
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                controller: widget.scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 20,
                  ),
                  child: MedsSearchBox(
                    onDosisChanged: (value) {
                      setState(() {
                        _gewaehlteDosisInSheet = value;
                        if (value != null) {
                          _buttonGezeigt = true;
                        }
                      });
                    },
                    onMedikamentChanged: (value) {
                      setState(() {
                        // Hier fangen wir den Namen ab!
                        _gewaehltesMedikamentInSheet = value;
                      });
                    },
                  ),
                ),
              ),
            ),

            if (_buttonGezeigt)
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 12),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: _gewaehlteDosisInSheet != null
                        ? () {
                            MedikamentenEintrag(
                              name: _gewaehlteDosisInSheet,
                              dosis: _gewaehlteDosisInSheet,
                            );
                          }
                        : null,

                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        _gewaehlteDosisInSheet != null
                            ? Colors.blue[300]
                            : Colors.blue[100],
                      ),
                    ),
                    child: Text(
                      "Hinzufügen",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
