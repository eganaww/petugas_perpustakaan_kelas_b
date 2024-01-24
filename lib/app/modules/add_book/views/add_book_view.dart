import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBookView'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.judulController,
                decoration: InputDecoration(hintText: "Masukkan Judul Buku"),
                validator: (value){
                  if (value!.length < 2){
                    return "Judul Buku tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.penulisController,
                decoration: InputDecoration(hintText: "Masukkan Nama Penulis Buku"),
                validator: (value){
                  if (value!.length < 2){
                    return "Nama Penulis tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.penerbitController,
                decoration: InputDecoration(hintText: "Masukkan Penerbit Buku"),
                validator: (value){
                  if (value!.length <2){
                    return "Penerbit tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.tahunTerbitController,
                decoration: InputDecoration(hintText: "Masukkan Tahun Terbit Buku"),
                validator: (value){
                  if (value!.length < 2){
                    return "Tahun Terbit tidak boleh kosong";
                  }
                  return null;
                },
              ),
              Obx(() => controller.loading.value?
              CircularProgressIndicator():
              ElevatedButton(onPressed: (){
                controller.post();
              }, child: Text("Tambah Buku")))
            ],
          ),
        ),
      ),
    );
  }
}
