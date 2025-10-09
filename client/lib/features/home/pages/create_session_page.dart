import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:client/features/home/widgets/session_workout_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateSessionPage extends StatefulWidget {
  const CreateSessionPage({super.key});

  @override
  State<CreateSessionPage> createState() => _CreateSessionPageState();
}

class _CreateSessionPageState extends State<CreateSessionPage> {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Create Sessions",
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
                  hintText: "Session Name",
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.white),
                          onPressed: () {
                            _controller.clear();
                            setState(() {});
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
              SizedBox(height: 10),
              // LongCustomButton(
              //   title: "+ Add Sets",
              //   onTap: () {},
              //   Bcolor: Color(0xff3B4141),
              // ),
              SizedBox(height: 10),
              LongCustomButton(
                title: "+ Add Exercises",
                onTap: () => context.push("/home/create_sessions/add_exercise"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
