import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final String? name;
  final int? umur;
  final String? alamat;

  const FormPage(
      {super.key,
      required this.name,
      required this.umur,
      required this.alamat});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int nilaiAwal = 0;

  void increment() {
    setState(() {
      nilaiAwal++;
    });
  }

  String? _nama, _alamat;
  int? _umur;

  @override
  void initState() {
    setState(() {
      _nama = widget.name;
      _alamat = widget.alamat;
      _umur = widget.umur;
    });
    super.initState();
  }

  @override
  void dispose() {
    nameC.dispose();
    umurC.dispose();
    alamatC.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final nameC = TextEditingController();
  final umurC = TextEditingController();
  final alamatC = TextEditingController();

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    // kalau ada erorr berhenti disini
    if (form == null || !form.validate()) return;

    form.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Page Form'),
              Text('NAMA : ${_nama}'),
              Text('UMUR :  ${_umur.toString()}'),
              Text('Alamat :  ${_alamat}'),
              Divider(),
              SizedBox(
                height: 25,
              ),
              Text(
                'Nilai Awal = $nilaiAwal',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              ElevatedButton(
                onPressed: increment,
                child: Text('Tambah++'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    nilaiAwal--;
                  });
                },
                child: Text('Kurang--'),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                autovalidateMode: _autovalidateMode,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Nama'),
                          Text(
                            '*',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: nameC,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Nama Harus diisi!';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _nama = value;
                          });
                        },
                      ),
                      Row(
                        children: [
                          Text('Umur'),
                          Text(
                            '*',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: umurC,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Umur Harus diisi!';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _umur = int.parse(value!);
                          });
                        },
                      ),
                      Row(
                        children: [
                          Text('Alamat'),
                          Text(
                            '*',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: alamatC,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Alamat Harus diisi!';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _alamat = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text('Submit'),
                      ),
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
