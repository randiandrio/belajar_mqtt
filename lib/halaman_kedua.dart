import 'package:animated_button/animated_button.dart';
import 'package:belajarprovider/mqtt.dart';
import 'package:belajarprovider/providers/lampu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HalamanKeduaPage extends StatefulWidget {
  const HalamanKeduaPage({super.key});

  @override
  State<HalamanKeduaPage> createState() => _HalamanKeduaPageState();
}

class _HalamanKeduaPageState extends State<HalamanKeduaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Kedua"),),
      body: Center(
        child: Consumer<LampuProvider>(
          builder: (context, status, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                status.isHidup
                    ? Image.asset("assets/img/menyala.png", width: 200, height: 200,)
                    : Image.asset("assets/img/padam.png", width: 200, height: 200,),
                const SizedBox(height: 50,),
                AnimatedButton(
                  child: Text(
                    status.isHidup ? "Matikan Lampu" : "Hidupkan Lampu",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    if(status.isHidup){
                      kirimPesan("0000");
                    }else{
                      kirimPesan("1111");
                    }
                    status.statusLampu(!status.isHidup);
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
