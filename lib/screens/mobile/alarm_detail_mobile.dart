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
    final width = size.width;
    final height = size.height;

    final double padding = (width * 0.04).clamp(12, 24);
    final double titleFontSize = (width * 0.09).clamp(24, 38);
    final double labelFontSize = (width * 0.03).clamp(10, 20);
    final double sectionSpacing = (height * 0.0075).clamp(5, 20);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarMobile(),
              SizedBox(height: sectionSpacing),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: TextField(
                  controller: nombreController,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontFamily: 'Rochester',
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nombre de la alarma",
                  ),
                ),
              ),
              SizedBox(height: sectionSpacing * 0.7),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Divider(color: Colors.grey.shade300, thickness: 1),
              ),
              SizedBox(height: sectionSpacing),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildTextFieldRow("Nombre:", nombreController, size, labelFontSize),
                      buildTextFieldRow("Hora:", horaController, size, labelFontSize),
                      buildDropdownRow(
                          "Lista asociada:", listaSeleccionada, listasDisponibles, (val) {
                        setState(() => listaSeleccionada = val);
                      }, size, labelFontSize),
                      buildDropdownRow(
                          "Sonido:", sonidoSeleccionado, sonidosDisponibles, (val) {
                        setState(() => sonidoSeleccionado = val);
                      }, size, labelFontSize),
                      SizedBox(height: sectionSpacing * 3),
                      buildSwitchTile("Mostrar lista al inicio", mostrarLista, (val) {
                        setState(() => mostrarLista = val);
                      }, size, labelFontSize),
                      SizedBox(height: sectionSpacing * 2),
                      buildSwitchTile("Asociar con Google Home", asociarGoogleHome, (val) {
                        setState(() => asociarGoogleHome = val);
                      }, size, labelFontSize),
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

  Widget buildTextFieldRow(String label, TextEditingController controller, Size size, double fontSize) {
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: (height * 0.004).clamp(2, 10),
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
                fontSize: fontSize,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.45,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: fontSize),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownRow(String label, String? value, List<String> items, ValueChanged<String?> onChanged, Size size, double fontSize) {
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: (height * 0.008).clamp(4, 10),
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
                fontSize: fontSize,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.3,
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              underline: const SizedBox(),
              items: items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: fontSize)),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchTile(String label, bool value, ValueChanged<bool> onChanged, Size size, double fontSize) {
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: (height * 0.001).clamp(2, 6),
      ),
      child: Container(
        width: double.infinity,
        height: (height * 0.06).clamp(40, 60),
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: (height * 0.01).clamp(4, 8),
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEBF5),
          borderRadius: BorderRadius.circular((width * 0.015).clamp(6, 12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontSize: fontSize)),
            Transform.scale(
              scale: width * 0.002,
              child: Switch(
                value: value,
                activeColor: Colors.black,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}