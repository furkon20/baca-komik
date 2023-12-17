import 'package:flutter/material.dart';

class myprofil extends StatelessWidget {
  myprofil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFIL'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 8,
            right: 20,
            left: 20,
            bottom: 8,
          ),
          color: Colors.blue,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cari komik',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.mic_outlined,
                        color: Colors.blue,
                      ), // Pindahkan ke sini
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
