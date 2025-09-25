import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/web/custom_app_bar_web.dart';

class AlarmDetailWebScreen extends StatefulWidget {
  final String nombre;
  final String hora;
  final String lista;
  final String sonido;

  const AlarmDetailWebScreen({
    super.key,
    required this.nombre,
    required this.hora,
    required this.lista,
    required this.sonido,
  });

  @override
  State<AlarmDetailWebScreen> createState() => _AlarmDetailWebScreenState();
}

class _AlarmDetailWebScreenState extends State<AlarmDetailWebScreen> {
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
                child: TextField(
                  controller: nombreController,
                  style: TextStyle(
                    fontSize: labelFont,
                    fontFamily: 'Rochester',
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nombre de la alarma",
                  ),
                ),
              ),

              SizedBox(height: height * 0.01),
              Padding(
                padding: EdgeInsets.only(left: width * 0.04, bottom: height * 0.01),
                child: Divider(color: Colors.grey.shade300),
              ),

              SizedBox(height: height * 0.01),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.04, top: height * 0.03),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextFieldRow("Nombre:", nombreController, size),
                              buildTextFieldRow("Hora:", horaController, size),
                              buildDropdownRow("Lista asociada:", listaSeleccionada,
                                  listasDisponibles, (val) {
                                setState(() => listaSeleccionada = val);
                              }, size),
                              buildDropdownRow("Sonido:", sonidoSeleccionado,
                                  sonidosDisponibles, (val) {
                                setState(() => sonidoSeleccionado = val);
                              }, size),
                            ],
                          ),
                        ),
                    
                        SizedBox(width: width * 0.05), // Separación entre columnas
                    
                        // Columna derecha - Switches
                        SizedBox(
                          width: width * 0.35, // 35% de la pantalla
                          child: Column(
                            children: [
                              buildSwitchTile(
                                  "Mostrar lista al inicio", mostrarLista, (val) {
                                setState(() => mostrarLista = val);
                              }, size),
                              SizedBox(height: height * 0.03),
                              buildSwitchTile("Asociar con Google Home",
                                  asociarGoogleHome, (val) {
                                setState(() => asociarGoogleHome = val);
                              }, size),
                              SizedBox(height: height * 0.03),
                              buildNotificationsTile("Notificación Personalizada", "NF1", size),
                            ],
                          ),
                        ),
                      ],
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
      padding: EdgeInsets.symmetric(vertical: height * 0.008, horizontal: width * 0.01),
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
      padding: EdgeInsets.symmetric(vertical: height * 0.008, horizontal: width * 0.01),
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
      padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: height * 0.005),
      child: Container(
        width: double.infinity,
        height: height * 0.075,
        padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.005),
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

  Widget buildNotificationsTile(
      String label, String option, Size size) {
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: height * 0.005),
      child: Container(
        width: double.infinity,
        height: height * 0.075,
        padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.005),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEBF5),
          borderRadius: BorderRadius.circular(width * 0.01),
        ),
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Funcionalidad no disponible")),
          );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(fontSize: width * 0.015)),
              Text(option, style: TextStyle(fontSize: width * 0.01)),
            ],
          ),
        ),
      ),
    );
  }
}