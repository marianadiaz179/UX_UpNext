import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/custom_app_bar.dart';

class AlarmDetailScreen extends StatefulWidget {
  final String nombre;
  final String hora;
  final String lista;
  final String sonido;

  const AlarmDetailScreen({
    super.key,
    required this.nombre,
    required this.hora,
    required this.lista,
    required this.sonido,
  });

  @override
  State<AlarmDetailScreen> createState() => _AlarmDetailScreenState();
}

class _AlarmDetailScreenState extends State<AlarmDetailScreen> {
  late TextEditingController nombreController;
  late TextEditingController horaController;

  String? listaSeleccionada;
  String? sonidoSeleccionado;

  bool mostrarLista = true;
  bool asociarGoogleHome = true;

  final List<String> listasDisponibles = ["Lista A", "Lista B", "Lista C", "Trello", "Google Tasks", "Asana", ""];
  final List<String> sonidosDisponibles = ["Sonido 1", "Sonido 2", "Sonido 3", "Breaking", "Beep", "Chill", ""];

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController(text: widget.nombre);
    horaController = TextEditingController(text: widget.hora);
    listaSeleccionada = widget.lista;
    sonidoSeleccionado = widget.sonido;
  }

  @override
  void dispose() {
    nombreController.dispose();
    horaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const CustomAppBar(),

              const SizedBox(height: 10),

              // 📝 Título editable
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: nombreController,
                  style: const TextStyle(
                    fontSize: 38,
                    fontFamily: 'Cursive',
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nombre de la alarma",
                  ),
                ),
              ),

              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15),
                child: Divider(color: Colors.grey.shade300),
              ),
              const SizedBox(height: 5),

              // 📋 Campos editables
              buildTextFieldRow("Nombre:", nombreController),
              buildTextFieldRow("Hora:", horaController),
              buildDropdownRow("Lista asociada:", listaSeleccionada, listasDisponibles, (val) {
                setState(() => listaSeleccionada = val);
              }),
              buildDropdownRow("Sonido:", sonidoSeleccionado, sonidosDisponibles, (val) {
                setState(() => sonidoSeleccionado = val);
              }),

              const SizedBox(height: 20),

              // 🔘 Switches
              buildSwitchTile("Mostrar lista al inicio", mostrarLista, (val) {
                setState(() => mostrarLista = val);
              }),
              const SizedBox(height: 16),
              buildSwitchTile("Asociar con Google Home", asociarGoogleHome, (val) {
                setState(() => asociarGoogleHome = val);
              }),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Helper: campo de texto editable
  Widget buildTextFieldRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(
            width: 160,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Helper: dropdown
  Widget buildDropdownRow(
      String label, String? value, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          DropdownButton<String>(
            value: value,
            underline: const SizedBox(),
            items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  // 🔹 Helper: switch interactivo
  Widget buildSwitchTile(String label, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEBF5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 16)),
            Switch(
              value: value,
              activeColor: Colors.black,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}