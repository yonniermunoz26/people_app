part of '../widgets.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(
        'Esta acción va a eliminar todas las personas actuales, ¿deseas continuar?',
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text('Confirmar'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
    ;
  }
}
