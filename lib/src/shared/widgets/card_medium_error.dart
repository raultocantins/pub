import 'package:flutter/material.dart';

// É usado na lista de posts, detalhes do post e detalhes do estabelecimento
class CardMediumError extends StatelessWidget {
  final Function() onPressed;
  const CardMediumError({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Não foi possível carregar',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Verifique sua conexão com a internet\ne tente novamente.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primary),
            ),
            child: const Text(
              'Tentar novamente',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
