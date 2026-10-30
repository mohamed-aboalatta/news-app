import 'package:flutter/material.dart';
import 'package:news_app/features/search/search_results.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 320,
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResults(query: value),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "search",
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xff0088FF)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                    ),
                    controller: controller,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    controller.clear();
                  },
                  child: Text("cancel", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
