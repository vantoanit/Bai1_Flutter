import 'package:flutter/material.dart';

class Dialogfromsinhvien extends StatefulWidget {
  late Function(Map<String, dynamic>) callback;

  Dialogfromsinhvien({required this.callback});

  @override
  State<Dialogfromsinhvien> createState() => _DialogfromsinhvienState();
}

class _DialogfromsinhvienState extends State<Dialogfromsinhvien> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> listGioiTinh = ['Nam', 'Nữ', 'Khác'];
  late String gioiTinhDaChon;

  DateTime selectDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2000, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectDate) {
      setState(() {
        selectDate = picked;
      });
    }
  }

  TextEditingController msvController = new TextEditingController();
  TextEditingController hoTenController = new TextEditingController();
  TextEditingController dienThoaiController = new TextEditingController();

  @override
  void initState() {
    setState(() {
      gioiTinhDaChon = 'Nam';
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        "Thêm sinh viên",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: Form(
        // key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //MSV
              TextFormField(
                controller: msvController,
                decoration: const InputDecoration(hintText: 'Ma SV'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập thông tin';
                  }
                  return null;
                },
              ),

              //Họ tên
              TextFormField(
                controller: hoTenController,
                decoration: const InputDecoration(hintText: 'Họ tên'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui long nhap thong tin';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // ngay sinh
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Ngày sinh",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                onTap: () => _selectDate(context),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: dienThoaiController,
                decoration: const InputDecoration(hintText: 'Điện thoại'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              // Giới tính
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white),
                padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: DropdownButton<String>(
                  value: gioiTinhDaChon,
                  elevation: 16,
                  hint: Text(
                    'Giới tính',
                  ),
                  underline: Container(
                    height: 0,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (newValue) {
                    print("Giới tính đã chọn: ${newValue}");
                    setState(() {
                      gioiTinhDaChon = newValue!;
                    });
                  },
                  items: listGioiTinh.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.callback({
                    'msv': msvController.text,
                    'hoten': hoTenController.text,
                    'ngaySinh': selectDate,
                    'gioiTinh': gioiTinhDaChon,
                    'dienthoai': dienThoaiController.text
                  });
                  Navigator.pop(context);
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color(0xff60eeea),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    Icon(
                      Icons.save,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Lưu lại",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),

            // Đóng
            GestureDetector(
              onTap: () {
                //  print("MSV: ${msvController.text}");
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    Icon(
                      Icons.close_rounded,
                      size: 18,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Đóng lại",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
