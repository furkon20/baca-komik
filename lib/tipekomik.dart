import 'package:flutter/material.dart';
import 'package:buku/TypeAll.dart';
import 'package:buku/TypeManga.dart';
import 'package:buku/TypeManhua.dart';
import 'package:buku/TypeManhwa.dart';


class tipeKomik extends StatelessWidget {
  const tipeKomik({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tipe Komik',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                String tipeKomik = '';
                String imagePath = '';
                if (index == 0) {
                  tipeKomik = 'All';
                  imagePath = 'images/all.png';
                } else if (index == 1) {
                  tipeKomik = 'Manga';
                  imagePath = 'images/jepang.jpg';
                } else if (index == 2) {
                  tipeKomik = 'Manhua';
                  imagePath = 'images/china.png';
                } else if (index == 3) {
                  tipeKomik = 'Manhwa';
                  imagePath = 'images/korsel.jpg';
                }

                return InkWell(
                  onTap: () {
                    // Tambahkan logika untuk menavigasi ke halaman kategori yang sesuai berdasarkan indeks.
                    // Anda dapat menggunakan Navigator untuk menavigasi ke halaman kategori.
                    if (index == 0) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) =>AllType()));
                    } else if (index == 1) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MYmanga()));
                    } else if (index == 2) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MYmanhua()));
                    } else if (index == 3) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MYmanhwa()));
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            imagePath,
                            width: 35,
                            height: 35,
                          ),
                        ),
                        Text(
                          tipeKomik,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
