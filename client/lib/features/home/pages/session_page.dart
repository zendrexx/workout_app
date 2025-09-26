import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:client/features/home/widgets/session_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  final TextEditingController _controller = TextEditingController();
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
        backgroundColor: const Color(0xff1D1D1D),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xffD3C061)),
                ),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Create",
                  style: TextStyle(color: Color(0xffD3C061)),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                cursorColor: Colors.white,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Program Name",
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.white),
                          onPressed: () {
                            _controller.clear();
                            setState(() {}); // refresh to hide the X
                          },
                        )
                      : null,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),

                  // Border when focused
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                onChanged: (value) {
                  setState(() {}); // refresh to show/hide the X
                },
              ),
              SizedBox(height: 10),
              SessionCardWidget(),
              SessionCardWidget(),
              LongCustomButton(title: "Add Sessions", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
