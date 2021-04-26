import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_bloc.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // ignore: close_sinks
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {

                final newUser = new Usuario(
                  nombre: 'Russell delgado',
                  edad: 24,
                  profesiones: ['Fullstack Developer']
                );

                usuarioBloc.add(
                  ActivarUsuario(newUser)
                );

              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                if(!usuarioBloc.state.existeUsuario ){
                  return _atencionMensaje(context , "ANTES DE AUMENTAR LA EDAD TIENE QUE ESTABLECER UN USUARIO");
                }
                usuarioBloc.add( CambiarEdad(30) );

              }
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                if(!usuarioBloc.state.existeUsuario ){
                  return _atencionMensaje(context ,  "ANTES DE AÑADIR PROFESIONES TIENE QUE ESTABLECER UN USUARIO");
                }

                  usuarioBloc.add( AgregarProfesion('Nueva Profesion') );

              }
            ),

          ],
        )
     ),
   );
  }

  Future _atencionMensaje(BuildContext context, String contenido) {
    return showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: Text("ATENCIÓN"),
                    content: Text(contenido),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
                    ],
                  ),);
  }
}