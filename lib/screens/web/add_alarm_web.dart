import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/web/custom_app_bar_web.dart';

class AddAlarmWebScreen extends StatefulWidget {
  const AddAlarmWebScreen({super.key});

  @override
  State<AddAlarmWebScreen> createState() => _AddAlarmWebScreenState();
}

class _AddAlarmWebScreenState extends State<AddAlarmWebScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController horaController = TextEditingController();

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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final padding = width * 0.03;
    final labelFont = width * 0.035;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarWeb(),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: Text(
                  "Crear Alarma",
                  style: TextStyle(
                    fontSize: labelFont * 1.2,
                    fontFamily: 'Rochester',
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, bottom: height * 0.01),
                child: Divider(color: Colors.grey.shade300),
              ),
              SizedBox(height: height * 0.01),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.04, top: height * 0.03),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextFieldRow(
                                  "Nombre:", nombreController, size),
                              buildTextFieldRow("Hora:", horaController, size),
                              buildDropdownRow("Lista asociada:",
                                  listaSeleccionada, listasDisponibles, (val) {
                                setState(() => listaSeleccionada = val);
                              }, size),
                              buildDropdownRow("Sonido:", sonidoSeleccionado,
                                  sonidosDisponibles, (val) {
                                setState(() => sonidoSeleccionado = val);
                              }, size),
                            ],
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        SizedBox(
                          width: width * 0.35,
                          child: Column(
                            children: [
                              buildSwitchTile(
                                  "Mostrar lista al inicio", mostrarLista,
                                  (val) {
                                setState(() => mostrarLista = val);
                              }, size),
                              SizedBox(height: height * 0.03),
                              buildSwitchTile(
                                  "Asociar con Google Home", asociarGoogleHome,
                                  (val) {
                                setState(() => asociarGoogleHome = val);
                              }, size),
                              SizedBox(height: height * 0.03),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: width * 0.05, bottom: height * 0.06),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: Text(
                      "Agregar",
                      style: TextStyle(
                        fontSize: width * 0.015,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE2CCD6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.02),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.01,
                      ),
                    ),
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
          vertical: height * 0.008, horizontal: width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 4,
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.015,
                ),
              )),
          SizedBox(
            width: width * 0.20,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: width * 0.015),
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
          vertical: height * 0.008, horizontal: width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 4,
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.015,
                ),
              )),
          SizedBox(
            width: width * 0.20,
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              underline: const SizedBox(),
              items: items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(fontSize: width * 0.015),
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
          horizontal: width * 0.01, vertical: height * 0.005),
      child: Container(
        width: double.infinity,
        height: height * 0.075,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.005),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEBF5),
          borderRadius: BorderRadius.circular(width * 0.01),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontSize: width * 0.015)),
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
