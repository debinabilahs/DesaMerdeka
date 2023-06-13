import 'package:flutter/material.dart';

class KerjasamaForm extends StatefulWidget {
  @override
  _KerjasamaFormState createState() => _KerjasamaFormState();
}

class _KerjasamaFormState extends State<KerjasamaForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _namaPerusahaan = '';
  String _jenisKerjasama = '';
  String _keterangan = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Lakukan sesuatu dengan data yang diisi pada form
      // Misalnya, kirim data ke server atau tampilkan data yang diisi

      print('Nama Perusahaan: $_namaPerusahaan');
      print('Jenis Kerjasama: $_jenisKerjasama');
      print('Keterangan: $_keterangan');

      // Reset form setelah data terkirim atau ditampilkan
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Text(
          'DESA MERDEKA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "ISI FORM KERJA SAMA",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Perusahaan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama perusahaan harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _namaPerusahaan = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Jenis Kerjasama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis kerjasama harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _jenisKerjasama = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Keterangan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Keterangan harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _keterangan = value!;
                },
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .green, // Ubah warna latar belakang menjadi hijau
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
