import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_flutter/models/producto_model.dart';
import 'package:sqflite_flutter/providers/producto_provider.dart';

class UpdatePage extends StatefulWidget {
  final Producto product;

  const UpdatePage({super.key, required this.product});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    final data = widget.product;
    final nombreController = TextEditingController(text: data.nombre);
    final categoriaController = TextEditingController(text: data.categoria);
    final precioCController = TextEditingController(text: data.precioc);
    final precioVController = TextEditingController(text: data.preciov);
    final stockController = TextEditingController(text: data.stock);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextFormField(
              controller: nombreController,
              hintText: 'Nombre producto',
              keyboardType: TextInputType.name,
            ),
            CustomTextFormField(
              controller: categoriaController,
              hintText: 'Categoria',
              keyboardType: TextInputType.name,
            ),
            CustomTextFormField(
              controller: precioCController,
              hintText: 'Precio Compra',
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              controller: precioVController,
              hintText: 'Precio Venta',
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              controller: stockController,
              hintText: 'Stock',
              keyboardType: TextInputType.number,
            ),
            MaterialButton(
              minWidth: 200,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                final productoProvider =
                    Provider.of<ProductoProvider>(context, listen: false);

                productoProvider.update(
                    data.id,
                    nombreController.text,
                    categoriaController.text,
                    precioCController.text,
                    precioVController.text,
                    stockController.text);
              },
              child: const Text(
                'Actulizar Producto',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;

  const CustomTextFormField(
      {super.key, this.controller, this.keyboardType, this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 156, 255, 149),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}
