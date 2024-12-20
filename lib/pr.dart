// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class TugasDirumah extends StatefulWidget {
  const TugasDirumah({super.key});

  @override
  State<TugasDirumah> createState() => _TugasDirumahState();
}

class _TugasDirumahState extends State<TugasDirumah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TUGAS {{NAMA ANDA}}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'INTRODUCE MY SELF',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgksyfppsKuOs7wKJ5YaidCLmXup8BjxK2GA&s',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Table(
                children: [
                  TableRow(
                    children: [
                      Text(
                        'NAMA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(': {{NAMA ANDA}}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Alamat',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(': {{ALAMAT ANDA}}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Umur',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(': {{Umur ANDA}}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Divisi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(': {{Divisi ANDA}}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Harapan tentang training',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(': {{Harapan Anda}}'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hobbie',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  'Makan',
                  'Game',
                  'Nonton',
                ]
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(label: Text(e)),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Social media',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      const snackBar = SnackBar(
                        /// need to set following properties for best effect of awesome_snackbar_content
                        elevation: 0,
                        duration: Duration(milliseconds: 10000),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'My Facebook Link',
                          message: 'Jangan lupa di follow yaa',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                          contentType: ContentType.warning,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    },
                    icon: Icon(
                      Icons.facebook,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
