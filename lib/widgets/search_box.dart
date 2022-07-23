import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  SearchBox({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 38,
        // margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Colors.white10 : Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          const Icon(Icons.search),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              controller: searchController,
              autocorrect: true,
              enableSuggestions: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Color(0xffA7A7A7),
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
                alignLabelWithHint: true,
                border: InputBorder.none,
              ),
            ),
          ),
        ]));
  }
}
