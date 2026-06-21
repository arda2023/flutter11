import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return
    // Der weiße Inhalts-Container passt sich jetzt flexibel an
    Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ), // Sieht mit abgerundeten Ecken cleaner aus
      ),
      child: Padding(
        padding: const EdgeInsets.all(16), // Gleichmäßiges Padding innen
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (value) {
                    controller.openView();
                  },
                  leading: Icon(Icons.search),
                );
              },
              suggestionsBuilder: (context, controller) { return  List<>},
            ),

            // Hier ist deine gewünschte Lücke zwischen den TextFields
            const SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                hintText: "Notiz",
                hintStyle: const TextStyle(color: Colors.black26),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.5),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
