import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/form.dart';

class BarisDuaPage extends StatelessWidget {
  const BarisDuaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.volume_up),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('Gradient'),
          ),
          //Pindah page
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FormPage(name: 'ilham', umur: 20, alamat: 'jl pekapuran'),
                ),
              );
            },
            child: Text('Pindah ke halaman Form'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 100,
              height: 30,
              color: Colors.red,
              child: Text('ini container button'),
            ),
          )
        ],
      ),
    );
  }
}
