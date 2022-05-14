import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class FlashLghtPage extends StatefulWidget {
  const FlashLghtPage({Key? key}) : super(key: key);

  @override
  State<FlashLghtPage> createState() => _FlashLghtPageState();
}

class _FlashLghtPageState extends State<FlashLghtPage> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlashLight"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            light
                ? Icon(
                    Icons.lightbulb,
                    color: Colors.yellow,
                    size: 160,
                  )
                : Icon(
                    Icons.lightbulb_outline,
                    color: Colors.black45,
                    size: 160,
                  ),
            Text("FlashLight"),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    light = !light;
                    //TODO turn on flashlight
                    FlashMode.torch;

                  });
                },
                child: light ? Text("Stop") : Text("Open"))
          ],
        ),
      ),
    );
  }
}
