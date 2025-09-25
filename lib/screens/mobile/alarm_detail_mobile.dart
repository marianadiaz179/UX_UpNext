import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/mobile/custom_app_bar_mobile.dart';

class AlarmDetailMobileScreen extends StatefulWidget {
  final String nombre;
  final String hora;
  final String lista;
  final String sonido;

  const AlarmDetailMobileScreen({
    super.key,
    required this.nombre,
    required this.hora,
    required this.lista,
    required this.sonido,
  });

  @override
  State<AlarmDetailMobileScreen> createState() =>
      _AlarmDetailMobileScreenState();
}

class _AlarmDetailMobileScreenState extends State<AlarmDetailMobileScreen> {
  late TextEditingController nombreController;
  late TextEditingController horaController;

  String? listaSeleccionada;
  String? sonidoSeleccionado;

  bool mostrarLista = true;
  bool asociarGoogleHome = true;

  final List<String> listasDisponibles = [
    "Lista A",
    "Lista B",
    "Lista C",
    "Trello",
    "Google Tasks",
    "Asana",
    ""
  ];

  final List<String> sonidosDisponibles = [
    "Sonido 1",
    "Sonido 2",
    "Sonido 3",
    "Breaking",
    "Beep",
    "Chill",
    ""
  ];

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
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarMobile(),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: TextField(
                  controller: nombreController,
                  style: const TextStyle(
                    fontSize: 38,
                    fontFamily: 'Rochester',
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nombre de la alarma",
                  ),
                ),
              ),
              SizedBox(height: height * 0.015),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                ),
                child: Divider(color: Colors.grey.shade300, thickness: 1),
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildTextFieldRow("Nombre:", nombreController, size),
                      buildTextFieldRow("Hora:", horaController, size),
                      buildDropdownRow("Lista asociada:", listaSeleccionada,
                          listasDisponibles, (val) {
                        setState(() => listaSeleccionada = val);
                      }, size),
                      buildDropdownRow(
                          "Sonido:", sonidoSeleccionado, sonidosDisponibles,
                          (val) {
                        setState(() => sonidoSeleccionado = val);
                      }, size),
                      SizedBox(height: height * 0.05),
                      buildSwitchTile("Mostrar lista al inicio", mostrarLista,
                          (val) {
                        setState(() => mostrarLista = val);
                      }, size),
                      SizedBox(height: height * 0.02),
                      buildSwitchTile(
                          "Asociar con Google Home", asociarGoogleHome, (val) {
                        setState(() => asociarGoogleHome = val);
                      }, size),
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

  Widget buildTextFieldRow(
      String label, TextEditingController controller, Size size) {
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.008,
        horizontal: width * 0.07,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 4,
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.04,
                ),
              )),
          SizedBox(
            width: width * 0.45,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: width * 0.04),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownRow(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged, Size size) {
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.008,
        horizontal: width * 0.07,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 4,
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.04,
                ),
              )),
          SizedBox(
            width: width * 0.35,
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              underline: const SizedBox(),
              items: items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchTile(
      String label, bool value, ValueChanged<bool> onChanged, Size size) {
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: height * 0.001,
      ),
      child: Container(
        width: double.infinity,
        height: height * 0.06,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.01,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEBF5),
          borderRadius: BorderRadius.circular(width * 0.015),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: width * 0.04),
            ),
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
