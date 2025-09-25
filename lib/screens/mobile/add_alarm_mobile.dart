import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/mobile/custom_app_bar_mobile.dart';

class AddAlarmMobileScreen extends StatefulWidget {
  const AddAlarmMobileScreen({super.key});

  @override
  State<AddAlarmMobileScreen> createState() => _AddAlarmMobileScreenState();
}

class _AddAlarmMobileScreenState extends State<AddAlarmMobileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

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

  void _saveAlarm() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final double labelFontSize = (width * 0.03).clamp(10, 20);
    final double sectionSpacing = (height * 0.0075).clamp(5, 20);
    final double paddingAll = width * 0.04;
    final double titleFont = width * 0.08;
    final double inputFont = width * 0.03;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(paddingAll),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarMobile(),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: Text(
                  "Crear Alarma",
                  style: TextStyle(
                    fontSize: titleFont,
                    fontFamily: 'Rochester',
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: height * 0.015),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Divider(color: Colors.grey.shade300, thickness: 1),
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTextFieldRow("Nombre:", _nameController, size, labelFontSize),
                      _buildTextFieldRow("Hora:", _timeController, size, labelFontSize),
                      _buildDropdownRow(
                          "Lista asociada:", listaSeleccionada, listasDisponibles, (val) {
                        setState(() => listaSeleccionada = val);
                      }, size, labelFontSize),
                      _buildDropdownRow(
                          "Sonido:", sonidoSeleccionado, sonidosDisponibles, (val) {
                        setState(() => sonidoSeleccionado = val);
                      }, size, labelFontSize),
                      SizedBox(height: sectionSpacing * 3),
                      _buildSwitchTile("Mostrar lista al inicio", mostrarLista, (val) {
                        setState(() => mostrarLista = val);
                      }, size, labelFontSize),
                      SizedBox(height: sectionSpacing * 2),
                      _buildSwitchTile("Asociar con Google Home", asociarGoogleHome, (val) {
                        setState(() => asociarGoogleHome = val);
                      }, size, labelFontSize),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.04, bottom: height * 0.02),
                  child: ElevatedButton(
                    onPressed: _saveAlarm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE2CCD6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.05),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.015),
                    ),
                    child: Text(
                      "Agregar",
                      style: TextStyle(color: Colors.black, fontSize: inputFont),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldRow(String label, TextEditingController controller, Size size, double fontSize) {
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

  Widget _buildDropdownRow(String label, String? value, List<String> items, ValueChanged<String?> onChanged, Size size, double fontSize) {
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

  Widget _buildSwitchTile(String label, bool value, ValueChanged<bool> onChanged, Size size, double fontSize) {
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