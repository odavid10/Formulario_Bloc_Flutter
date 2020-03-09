import 'package:rxdart/rxdart.dart';
import 'dart:io';

import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';

class ProductosBloc {

  final _productosController = new BehaviorSubject<List<ProductoModel>>();
  final _cargandoController = new BehaviorSubject<bool>();
  final _productosProvider = new productosProvider();

  Stream<List<ProductoModel>> get productoStream => _productosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarProductos () async {
    final productos = await _productosProvider.cargarProductos();
    _productosController.sink.add(productos);
  }

  void agregarProducto(ProductoModel producto) async {
    _cargandoController.sik.add(true);
    await _productosProvider.cargarProductos(producto);
    _cargandoController.sik.add(false);
  }

  Future<String> subirFoto(File foto){
     _cargandoController.sik.add(true);
    final fotoUrl = await _productosProvider.subirFoto(foto);
    _cargandoController.sik.add(false);
    return fotoUrl;
  }

  void editarProducto(ProductoModel producto) async {
    _cargandoController.sik.add(true);
    await _productosProvider.editarProductos(producto);
    _cargandoController.sik.add(false);
  }

  void borrarProducto(String id) async {
    await _productosProvider.borrarProducto(id);
  }

  dispose(){
    _productosController?.close();
    _cargandoController?.close();
  }

}