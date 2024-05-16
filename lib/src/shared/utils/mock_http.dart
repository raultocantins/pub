class MockHttpResponse {
  static const defaultDuration = Duration(milliseconds: 1500);
  static Future<Map<String, dynamic>> getPostsSuccess(
      {Duration duration = defaultDuration}) async {
    await Future.delayed(duration);
    return {
      'list': [
        {
          "id": "1",
          "imageUrl":
              "https://img.criativodahora.com.br/2023/11/criativo-6565319d067acMjcvMTEvMjAyMyAyMWgxNw==.jpg",
          "title": "Dobradinha hoje e amanhã",
          "pubName": "Ponto Chopp",
          "date": "2024-05-16T14:30:45.123456Z",
          "pubId": "1",
          "pubImageUrl":
              "https://img.criativodahora.com.br/2023/11/criativo-6565319d067acMjcvMTEvMjAyMyAyMWgxNw==.jpg"
        },
        {
          "id": "2",
          "imageUrl":
              "https://www.choppkremer.com.br/blog/wp-content/uploads/2015/07/11698587_681433185333624_7614951627010680768_n1.jpg",
          "title": "Noite de Jazz ao Vivo",
          "pubName": "The Jazz Club",
          "date": "2024-05-17T19:00:00.000000Z",
          "pubId": "2",
          "pubImageUrl":
              "https://www.choppkremer.com.br/blog/wp-content/uploads/2015/07/11698587_681433185333624_7614951627010680768_n1.jpg"
        },
        {
          "id": "3",
          "imageUrl":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTup_8ZCE64XycBSeJTcB9Fu2e_RwH2GbqOx21oPL2W1g&s",
          "title": "Festa Latina",
          "pubName": "Casa de Salsa",
          "date": "2024-05-18T22:00:00.000000Z",
          "pubId": "3",
          "pubImageUrl":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTup_8ZCE64XycBSeJTcB9Fu2e_RwH2GbqOx21oPL2W1g&s"
        },
        {
          "id": "4",
          "imageUrl":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReKvav_4lQwzOp2AfXKtfQnPsNP1Ph1OV52Wgj2H9_rQ&s",
          "title": "Noite de Trivia",
          "pubName": "The Quiz Bar",
          "date": "2024-05-19T20:00:00.000000Z",
          "pubId": "4",
          "pubImageUrl":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReKvav_4lQwzOp2AfXKtfQnPsNP1Ph1OV52Wgj2H9_rQ&s"
        },
        {
          "id": "5",
          "imageUrl":
              "https://http2.mlstatic.com/D_NQ_NP_954056-MLB53865480617_022023-O.webp",
          "title": "Happy Hour de Verão",
          "pubName": "Sunset Lounge",
          "date": "2024-05-20T17:00:00.000000Z",
          "pubId": "5",
          "pubImageUrl":
              "https://http2.mlstatic.com/D_NQ_NP_954056-MLB53865480617_022023-O.webp"
        },
        {
          "id": "6",
          "imageUrl":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDYLeyV-9DhmxTIYFzqwt-DqROgOU0zpLH1UfJVsnX5A&s",
          "title": "Noite de Stand-up Comedy",
          "pubName": "The Laugh Factory",
          "date": "2024-05-21T21:00:00.000000Z",
          "pubId": "6",
          "pubImageUrl":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDYLeyV-9DhmxTIYFzqwt-DqROgOU0zpLH1UfJVsnX5A&s"
        },
        {
          "id": "7",
          "imageUrl":
              "https://tribunadejundiai.com.br/wp-content/uploads/2020/04/WhatsApp-Image-2020-04-17-at-4.14.png",
          "title": "Exposição de Arte Moderna",
          "pubName": "Gallery 23",
          "date": "2024-05-22T15:00:00.000000Z",
          "pubId": "7",
          "pubImageUrl":
              "https://tribunadejundiai.com.br/wp-content/uploads/2020/04/WhatsApp-Image-2020-04-17-at-4.14.png"
        },
        {
          "id": "8",
          "imageUrl":
              "https://www.blogderocha.com.br/wp-content/uploads/2018/04/30859151_1649340901839965_1689815865_n-1.jpg",
          "title": "Noite de Sushi",
          "pubName": "Sushi Palace",
          "date": "2024-05-23T19:30:00.000000Z",
          "pubId": "8",
          "pubImageUrl":
              "https://www.blogderocha.com.br/wp-content/uploads/2018/04/30859151_1649340901839965_1689815865_n-1.jpg"
        },
        {
          "id": "9",
          "imageUrl":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqL9B_ApVUDojs6-0s0UpTABK5hOZugo1hd74IELUCsw&s",
          "title": "Concerto Acústico",
          "pubName": "Acoustic Lounge",
          "date": "2024-05-24T18:00:00.000000Z",
          "pubId": "9",
          "pubImageUrl":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqL9B_ApVUDojs6-0s0UpTABK5hOZugo1hd74IELUCsw&s"
        },
        {
          "id": "10",
          "imageUrl":
              "https://rondoniaovivo.com/imagensNoticias/LOUVADA-1-1.jpg",
          "title": "Noite de Carnaval",
          "pubName": "Rio Carnival Club",
          "date": "2024-05-25T22:00:00.000000Z",
          "pubId": "10",
          "pubImageUrl":
              "https://rondoniaovivo.com/imagensNoticias/LOUVADA-1-1.jpg"
        }
      ],
      'hasMore': true,
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

  static Future<Map<String, dynamic>> getMapPubs(
      {Duration duration = defaultDuration}) async {
    await Future.delayed(duration);
    // -10.24399, -48.32473
    return {
      'pubs': [
        {
          'id': '1',
          'imageUrl': 'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg',
          'lat': -10.24399,
          'lng': -48.32473,
          'pubName': 'Bar do Preto',
          'address': '1004sul alameda 14 lote 04',
          'images': [
            'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg',
            'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg'
          ],
        },
        {
          'id': '2',
          'imageUrl': 'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg',
          'lat': -10.24399,
          'lng': -48.31073,
          'pubName': 'Bar do Preto',
          'address': '1004sul alameda 14 lote 04',
          'images': [
            'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg',
            'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg'
          ],
        },
        {
          'id': '3',
          'imageUrl': 'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg',
          'lat': -10.24399,
          'lng': -48.32933,
          'pubName': 'Bar do Preto',
          'address': '1004sul alameda 14 lote 04',
          'images': [
            'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg',
            'https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg'
          ],
        }
      ],
    };
  }
}
