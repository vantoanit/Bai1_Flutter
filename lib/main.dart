import 'package:crud_sv/widget/DialogFromSinhVien.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Map<String, dynamic>> sinhViens = [
    {
      "anhDaiDien": null,
      "maSV": 35132,
      "hoTen": "Nguyen Van Toan",
      "gioiTinh": "Nam",
      "chieuCao": 1.7,
      "dienThoai": "0867189412"
    },
    {
      "anhDaiDien": null,
      "maSV": 48293,
      "hoTen": "Tran Lenh Truong",
      "gioiTinh": "Nam",
      "chieuCao": 1.5,
      "dienThoai": "0866419412"
    },
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Color(0xff66FFFF),
            child: Container(
                padding: EdgeInsets.all(8),
                //  color: Color(0xff66FFFF),
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mã SV: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(sinhViens[index]['maSV'].toString())
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outlined,
                          color: Colors.blue,
                          size: 22.0,
                        ),
                        Text("${sinhViens[index]['hoTen']}"),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.transgender,
                              color: Colors.blue,
                              size: 20.0,
                            ),
                            Text("${sinhViens[index]['gioiTinh']}"),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.blue,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text('${sinhViens[index]['dienThoai']}')
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialogfromsinhvien(
                                      callback: (value) {
                                        setState(() {
                                          sinhViens.add(
                                            {
                                              "anhDaiDien": null,
                                              "maSV": value['msv'],
                                              "hoTen": value['hoten'],
                                              "gioiTinh": value['gioiTinh'],
                                              "chieuCao": null,
                                              "dienThoai": value['dienthoai'],
                                            },
                                          );
                                        });
                                      },
                                    );
                                  });
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 22.0,
                              color: Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              size: 22.0,
                              color: Colors.blue,
                            ))
                      ],
                    )
                  ],
                )),
          );
        },
        itemCount: sinhViens.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialogfromsinhvien(
                  callback: (value) {
                    setState(() {
                      sinhViens.add(
                        {
                          "anhDaiDien": null,
                          "maSV": value['msv'],
                          "hoTen": value['hoten'],
                          "gioiTinh": value['gioiTinh'],
                          "chieuCao": null,
                          "dienThoai": value['dienthoai'],
                        },
                      );
                    });
                  },
                );
              });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
