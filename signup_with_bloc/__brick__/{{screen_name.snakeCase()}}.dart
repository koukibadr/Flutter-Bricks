import 'package:flutter/material.dart';


class {{screen_name.pascalCase()}} extends StatefulWidget {
  const {{screen_name.pascalCase()}}({Key? key}) : super(key: key);

  @override
  State<{{screen_name.pascalCase()}}> createState() => _{{screen_name.pascalCase()}}State();
}

class _{{screen_name.pascalCase()}}State extends State<{{screen_name.pascalCase()}}> {
  

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
     return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(
              FocusNode(),
            );
          },
          child: Scaffold(),
        );
  }
}
