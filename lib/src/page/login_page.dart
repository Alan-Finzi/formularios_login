import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocks/provider.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
         _loginForm(context),
        ],
      )
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;


    final fondoMorado=  Container(
      height: size.height*0.4 ,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(63, 63, 156, 1.0),
              Color.fromRGBO(90, 70, 178, 1.0)
            ])
      ),
    );
final circulo = Container(
  width: 100.0,
  height: 100.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100.0),
    color:  Color.fromRGBO(255, 255, 255, 0.05)
  ),
);


    final centro = Container(
      padding: EdgeInsets.only(top: 60.0 ),
   child: Column(
     children: <Widget>[
       Icon(Icons.person_pin_circle,color: Colors.white,size: 100.0,),
       SizedBox(height: 10.0,width: double.infinity,),
       Text('Alan Finzi',style: TextStyle(color: Colors.white,fontSize: 25.0 ))
     ],
   ),
      );


    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned( child: circulo, top: 90.0, left: 30.0),
        Positioned( child: circulo, top: -40, left: -30.0),
        Positioned( child: circulo, bottom: -500.0, left:-10.0),
        centro

      ],
    );

  }

  Widget _loginForm(BuildContext context) {

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
     child: Column(
       children: <Widget>[
         SafeArea(child: Container(height: 180.0,)),
         Container(
           width: size.width * 0.85 ,
           margin: EdgeInsets.symmetric(vertical: 30.0),
           padding: EdgeInsets.symmetric(vertical: 50.0),
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(20.0),
             boxShadow: <BoxShadow>[
               BoxShadow(color: Colors.black26,
               blurRadius: 3.0,
               offset: Offset(0.0, 5.0),
               spreadRadius: 3.0)
             ]

           ),
           child:  Column(
             children: <Widget>[
               Text('Ingreso',style: TextStyle(fontSize: 20.0)),
               SizedBox(height: 60.0),
               _crearMail(bloc),
               SizedBox(height: 30.0,),
               _crearPassword(),
               SizedBox(height: 30.0,),
               _crearBoton()
             ],
           ),
         ),
         Text('¿olvido contraseña?'),
         SizedBox(height: 100.0,)
       ],
     ),
    );
  }

 Widget _crearMail(LoginBloc bloc ) {

    StreamBuilder(
      stream: bloc.emailStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon (Icons.alternate_email,color: Colors.deepPurple,),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electrÃ³nico',
                counterText: snapshot.data,
                errorText: snapshot.error

            ),
            onChanged:bloc.changeEmail ,
          ),
        );
      },
    );

 }


  Widget _crearPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon (Icons.block,color: Colors.deepPurple,),
            labelText: 'contraseña'
        ),
      ),
    );
  }


  Widget _crearBoton(){

    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 15.0),
        child: Text('ingresar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10.0,
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: (){},
    );
  }



}
