import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddExercisePage extends StatefulWidget {
  const AddExercisePage({super.key});

  @override
  State<AddExercisePage> createState() => _AddExercisePageState();
}

class _AddExercisePageState extends State<AddExercisePage> {
  final Set<int> _selectedSessions = {};
  final TextEditingController _controller = TextEditingController();

  void _toggleSession(int index) {
    setState(() {
      if (_selectedSessions.contains(index)) {
        _selectedSessions.remove(index);
      } else {
        _selectedSessions.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Create Program",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color(0xff0F0F0F),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => context.push('/home'),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xffE2725B)),
                ),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {},
                child: Text("Create", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 16),
            ],
          ),
        ],
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff0F0F0F),
      body: Stack(
        children: [
          SizedBox.expand(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      cursorColor: Colors.white,
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff4E4A43),
                        hintText: "Search sessions",
                        hintStyle: TextStyle(color: Color(0xff89898A)),
                        prefixIcon: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Color(0xff89898A),
                          ),
                          onPressed: () {
                            _controller.clear();
                            setState(() {}); // refresh to hide the X
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ), // rounded corners
                          borderSide:
                              BorderSide.none, // removes the border line
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   itemCount: 5,
                    //   itemBuilder: (context, index) {
                    //     return GestureDetector(
                    //       onTap: () => _toggleSession(index),
                    //       child: exerciseCardWidget(
                    //         isSelectable: true,
                    //         isSelected: _selectedSessions.contains(index),
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
          if (_selectedSessions.isNotEmpty) ...[
            Positioned(
              right: 0,
              bottom: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F4F4F),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  elevation: 4,
                ),
                child: Text(
                  "Add ${_selectedSessions.length} sessions",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
