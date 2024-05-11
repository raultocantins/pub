class MockHttpResponse {
  static const defaultDuration = Duration(seconds: 2);
  static Future<Map<String, dynamic>> getPostsSuccess(
      {Duration duration = defaultDuration}) async {
    await Future.delayed(duration);
    return {
      'list': [
        {
          'id': '1',
          'imageUrl': 'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg',
          'title': 'Dobradinha hoje e amanhã',
          'pubName': 'Ponto Chopp',
          'date': DateTime.now().add(const Duration(days: 1)).toString(),
          'pubId': '1',
          'pubImageUrl':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoJKPH-h_gdTfWpHIYGtU8tN4m86Ds8GsQ8zi_aPC0b1iHc5Q1u3BV7B3fFHGrlp0wTqY&usqp=CAU'
        },
        {
          'id': '2',
          'imageUrl':
              'https://media-cdn.tripadvisor.com/media/photo-s/0e/20/0f/54/5-variedades-de-chopp.jpg',
          'title': 'Chopp em dobro aqui',
          'pubName': 'Bixxos bar',
          'date': DateTime.now().add(const Duration(days: 1)).toString(),
          'pubId': '2',
          'pubImageUrl':
              'https://leonardoconcon.com.br/wp-content/uploads/2022/09/capa-galpao.jpg'
        },
        {
          'id': '3',
          'imageUrl':
              'https://curitibahonesta.com.br/wp-content/uploads/2023/04/Banda-E-Noix-foto-Aline-Feliz.jpg',
          'title': 'Música e gastronomia',
          'pubName': 'Bar do Preto',
          'date': DateTime.now().add(const Duration(days: 1)).toString(),
          'pubId': '3',
          'pubImageUrl':
              'https://cdn.myportfolio.com/d6c082f2-b6de-4ca4-a88f-bc28c94c914e/d5c56653-7064-441d-a4f1-01fea5162342_rw_3840.jpg?h=5abcd188adc549357fa58a34a45bcd10'
        },
      ],
      'hasMore': false,
      'page': 1
    };
  }

  static Future<Map<String, dynamic>> getDetailSuccess(
      {Duration duration = defaultDuration}) async {
    await Future.delayed(duration);
    return {
      'description':
          '🍻 Não perca nossa Promoção de Chopp Especial Hoje! 🍻Junte-se a nós hoje à noite no nosso querido bar para uma noite inesquecível de diversão e sabor! Para tornar a sua experiência ainda mais incrível, estamos oferecendo uma promoção especial de chopp que você não vai querer perder!',
      'lat': -10.24399,
      'lng': -48.32473,
    };
  }

  static Future<Map<String, dynamic>> getDetailPubSuccess(
      {Duration duration = defaultDuration}) async {
    await Future.delayed(duration);
    return {
      'images': [
        'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg',
        'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg'
      ],
      'contactNumber': '63992086480',
      'address': '1004sul alameda 14 lote 04',
      'lat': -10.24399,
      'lng': -48.32473,
    };
  }
}
