import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _date = '';

  String _optionSelected = 'Manuel';

  List<String> _users = ['Manuel','Juan','Maria', 'Fernando', 'Octavia', 'Andres'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
          Divider(),
          _dropdownBorderShape()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(

      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el Nombre',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: (value) => setState(() {
        _email = value;
      }),
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.password),
        icon: Icon(Icons.security),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  

  _crearFecha(BuildContext context) {
    return TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        decoration: InputDecoration(
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha de Nacimiento',
          suffixIcon: Icon(Icons.date_range),
          icon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus((new FocusNode()));
          _selectDate(context);
        });
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 4),
        lastDate: DateTime(2025)
        locale: Locale('es','ES'));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>>_getOptionsDropdown(){

    List<DropdownMenuItem<String>> lista =[];
    _users.forEach((user) {
      lista.add(DropdownMenuItem(child:Text(user) ,value:user));
    });

    return lista;
  }

  _crearDropdown() {
    return DropdownButton(
      
      value: _optionSelected,
      items: _getOptionsDropdown(),
      onChanged: (opt) { 

        setState((){
        _optionSelected = opt.toString();
        });
      },
    );
  }

  _dropdownBorderShape(){
    
    return InputDecorator(
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                contentPadding: EdgeInsets.all(15),
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    value: '',
                    isDense: true,
                    isExpanded: true,
                    items: [
                        DropdownMenuItem(child: Text("Example Outline Dropdown"), value: ""),
                        DropdownMenuItem(child: Text("Male"), value: "Male"),
                        DropdownMenuItem(child: Text("Female"), value: "Female"),
                    ],
                    onChanged: (newValue) {
                        setState(() {
                        });
                    },
                ),
            ),
        );
  }

  _crearPersona() {
    return ListTile(
        title: Text('Nombres es: $_nombre'),
        subtitle: Text('Correo electronico: $_email'),
        trailing: Text(_optionSelected),);
  }
}
