class MockHttpResponse {
  static const defaultDuration = Duration(milliseconds: 500);
  static Future<Map<String, dynamic>> getPostsSuccess(
      {Duration duration = defaultDuration}) async {
    await Future.delayed(duration);
    return {
      'list': [
        {
          "id": "1",
          "imageUrl": "https://images.sympla.com.br/6606fca511ff1-xs.png",
          "title": "Dobradinha hoje e amanhã",
          "pubName": "Ponto Chopp",
          "date": "2024-05-16T14:30:45.123456Z",
          "pubId": "1",
          "pubImageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png"
        },
        {
          "id": "2",
          "imageUrl": "https://images.sympla.com.br/634e901cba533-xs.png",
          "title": "Happy Hour na Sexta",
          "pubName": "Bar do Zé",
          "date": "2024-06-18T17:45:30.654321Z",
          "pubId": "2",
          "pubImageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png"
        },
        {
          "id": "3",
          "imageUrl": "https://images.sympla.com.br/5d91f9b5ca990-xs.jpg",
          "title": "Festival de Churrasco",
          "pubName": "Churrasquinho da Esquina",
          "date": "2024-07-20T12:15:00.789012Z",
          "pubId": "3",
          "pubImageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png"
        },
        {
          "id": "4",
          "imageUrl": "https://images.sympla.com.br/65dce39c6e5dc-xs.png",
          "title": "Noite Italiana",
          "pubName": "Cantina da Nonna",
          "date": "2024-08-10T19:00:00.123456Z",
          "pubId": "4",
          "pubImageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png"
        },
        {
          "id": "5",
          "imageUrl": "https://images.sympla.com.br/66193b7c1f284-xs.png",
          "title": "Festa das Cervejas Artesanais",
          "pubName": "Brewer's Pub",
          "date": "2024-09-25T16:30:00.654321Z",
          "pubId": "5",
          "pubImageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png"
        },
        {
          "id": "6",
          "imageUrl":
              "https://www.setedias.com.br/sig/www/openged/conteudos/30973/030973_65e1d066b4e81_Democrata.png",
          "title": "Karaokê Night",
          "pubName": "Karaokê Bar",
          "date": "2024-10-05T21:00:00.789012Z",
          "pubId": "6",
          "pubImageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png"
        },
        {
          "id": "7",
          "imageUrl":
              "https://violashow.blob.core.windows.net/noticias/f696ae30-f7d0-450e-ada5-125fd7dcb4f2/galeria/galeria-f696ae30-f7d0-450e-ada5-125fd7dcb4f2.jpg",
          "title": "Rock ao Vivo",
          "pubName": "Rock'n Roll Bar",
          "date": "2024-11-15T23:30:00.321456Z",
          "pubId": "7",
          "pubImageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png"
        },
        {
          "id": "8",
          "imageUrl":
              "https://cdn0.casamentos.com.br/vendor/3243/3_2/640/png/chopp-brahma-gelado_13_383243-168415670362745.jpeg",
          "title": "Festival de Vinhos",
          "pubName": "Wine House",
          "date": "2024-12-20T18:00:00.654789Z",
          "pubId": "8",
          "pubImageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png"
        },
        {
          "id": "9",
          "imageUrl":
              "https://salomebar.com.br/wp-content/uploads/2015/10/chopp-brahma-2.jpg",
          "title": "Noite de Jazz",
          "pubName": "Jazz Club",
          "date": "2024-11-25T22:00:00.789123Z",
          "pubId": "9",
          "pubImageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png"
        },
        {
          "id": "10",
          "imageUrl":
              "https://www.designi.com.br/images/preview/10870639-m.jpg",
          "title": "Cervejaria ao Ar Livre",
          "pubName": "Open Air Brewery",
          "date": "2024-10-30T15:45:00.321654Z",
          "pubId": "10",
          "pubImageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png"
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
        'https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg',
        'https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large',
        'https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg'
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

    return {
      'pubs': [
        {
          "id": "1",
          "imageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png",
          "lat": -10.247900412534616,
          "lng": -48.33750699810195,
          "pubName": "Bar do Preto",
          "address": "1004sul alameda 14 lote 04",
          "images": [
            "https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg",
            "https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large",
            "https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg"
          ]
        },
        {
          "id": "2",
          "imageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png",
          "lat": -10.244589248808335,
          "lng": -48.32779771677308,
          "pubName": "Bar do João",
          "address": "Avenida Sete de Setembro, 1534",
          "images": [
            "https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg",
            "https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large",
            "https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg"
          ]
        },
        {
          "id": "3",
          "imageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png",
          "lat": -10.248483378961742,
          "lng": -48.32423572981375,
          "pubName": "Boteco do Rio",
          "address": "Rua do Ouvidor, 60",
          "images": [
            "https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg",
            "https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large",
            "https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg"
          ]
        },
        {
          "id": "4",
          "imageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png",
          "lat": -10.248353357051272,
          "lng": -48.32047601880764,
          "pubName": "Pub da Paulista",
          "address": "Avenida Paulista, 1234",
          "images": [
            "https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg",
            "https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large",
            "https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg"
          ]
        },
        {
          "id": "5",
          "imageUrl": "https://pbs.twimg.com/media/Evo6MqKWQAIJ3P4.jpg",
          "lat": -10.254584378023937,
          "lng": -48.32126702409891,
          "pubName": "Curitiba's Bar",
          "address": "Praça Tiradentes, 5",
          "images": [
            "https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg",
            "https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large",
            "https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg"
          ]
        },
        {
          "id": "6",
          "imageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png",
          "lat": -10.238812287881341,
          "lng": -48.32120224810083,
          "pubName": "Bar da Lagoa",
          "address": "Rua Sapucaí, 200",
          "images": [
            "https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg",
            "https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large",
            "https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg"
          ]
        },
        {
          "id": "7",
          "imageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png",
          "lat": -10.235826960931437,
          "lng": -48.32588537781406,
          "pubName": "Brasília Bar",
          "address": "Esplanada dos Ministérios",
          "images": [
            "https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg",
            "https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large",
            "https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg"
          ]
        },
        {
          "id": "8",
          "imageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png",
          "lat": -10.232192257414551,
          "lng": -48.326149350916396,
          "pubName": "Fortaleza Bar",
          "address": "Avenida Beira Mar, 1000",
          "images": [
            "https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg",
            "https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large",
            "https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg"
          ]
        },
        {
          "id": "9",
          "imageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png",
          "lat": -10.226544646881301,
          "lng": -48.31823479065789,
          "pubName": "Bar do Pará",
          "address": "Ver-o-Peso, 45",
          "images": [
            "https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg",
            "https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large",
            "https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg"
          ]
        },
        {
          "id": "10",
          "imageUrl":
              "https://pbs.twimg.com/profile_images/1145690516018909184/zJUt5OzG_400x400.png",
          "lat": -10.223662957681759,
          "lng": -48.32706299681698,
          "pubName": "Goiânia Pub",
          "address": "Avenida Goiás, 125",
          "images": [
            "https://img.restaurantguru.com/racf-Ponto-Chopp-PMW-interior.jpg",
            "https://pbs.twimg.com/media/F36M9ufXIAADPEB.jpg:large",
            "https://img.restaurantguru.com/c142-Pub-and-bar-Ponto-Chopp-PMW-interior.jpg"
          ]
        }
      ],
    };
  }
}
