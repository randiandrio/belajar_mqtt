import 'package:animated_button/animated_button.dart';
import 'package:belajarprovider/mqtt.dart';
import 'package:belajarprovider/providers/lampu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'halaman_kedua.dart';

class HalamanUtamaPage extends StatefulWidget {
  const HalamanUtamaPage({super.key});

  @override
  State<HalamanUtamaPage> createState() => _HalamanUtamaPageState();
}

class _HalamanUtamaPageState extends State<HalamanUtamaPage> {


  @override
  void initState() {
    jalankanMqtt(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Utama"),),
      body: Center(
        child: Consumer<LampuProvider>(
          builder: (context, status, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                status.isHidup
                    ? Image.asset("assets/img/menyala.png", width: 200, height: 200,)
                    : Image.asset("assets/img/padam.png", width: 200, height: 200,),
                SizedBox(height: 50,),
                AnimatedButton(
                  child: const Text(
                    'Halaman Ke Dua',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HalamanKeduaPage()));
                  },
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
