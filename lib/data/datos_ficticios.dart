import 'package:comida__full_negro/models/Comida.dart';

var comidaDisponible = [
  Comida(
      nombre: 'Hot cakes',
      imagenUrl: 'assets/images/hot-cakes.png',
      precio: 5,
      descripcion:
          'Nuestros Hot Cakes son una maravillosa delicia que te hará sentir como en casa. Preparados con una mezcla de ingredientes frescos y de la más alta calidad, nuestros hot cakes son esponjosos y dorados, una verdadera obra de arte culinaria.',
      tipoComida: TipoComida.desayuno),
  Comida(
      nombre: 'Tortilla con pollo',
      imagenUrl: 'assets/images/tortilla-pollo.png',
      precio: 5.5,
      descripcion:
          'Nuestra Tortilla tipo Taco con Pollo te transportará directamente a los sabores tradicionales de México. Esta delicia culinaria comienza con tiernas y jugosas tiras de pollo marinado con una mezcla de especias y sabores auténticos.',
      tipoComida: TipoComida.almuerzo),
  Comida(
      nombre: 'Avena con yogur griego',
      imagenUrl: 'assets/images/avena.png',
      precio: 2,
      descripcion:
          'Preparamos nuestra avena con copos de avena integrales, cocinados a fuego lento para lograr una textura suave y cremosa. Luego, la acompañamos con una generosa porción de yogur griego cremoso y rico en proteínas.',
      tipoComida: TipoComida.merienda),
  Comida(
      nombre: 'Filete de res',
      imagenUrl: 'assets/images/carne-asada.png',
      precio: 9,
      descripcion:
          'Nuestro exquisito Filete de Carne Premium a la Parrilla es una verdadera delicia para los amantes de la gastronomía. El corte de carne cuidadosamente seleccionado es cocinado a la perfección en nuestra parrilla, asegurando una jugosidad y ternura incomparables en cada bocado.',
      tipoComida: TipoComida.almuerzo),
  Comida(
      nombre: 'Cerdo enrollado',
      imagenUrl: 'assets/images/cerdoEnrollado.png',
      precio: 12,
      descripcion:
          'Un plato que te transportará a una experiencia gastronómica inolvidable. Imagina tiernas y delgadas tiras de carne de cerdo, meticulosamente sazonadas con una selección de especias secretas y hierbas frescas, enrolladas con esmero y cocinadas a la perfección en nuestro horno tradicional o a la parrilla.',
      tipoComida: TipoComida.merienda),
  Comida(
      nombre: 'Cuy asado',
      imagenUrl: 'assets/images/cuy.png',
      precio: 11.5,
      descripcion:
          'Acompañamos este plato con papas cocidas, tiernas y con un toque de mantequilla, que complementan perfectamente la textura del cuy. La lechuga fresca y crujiente sirve como una refrescante guarnición, agregando un toque de frescura y equilibrio a la combinación de sabores.',
      tipoComida: TipoComida.merienda),
  Comida(
      nombre: 'Empanadas',
      imagenUrl: 'assets/images/empanada.png',
      precio: 1.5,
      descripcion:
          'Cada empanada ha sido amorosamente preparada con una masa crujiente y dorada, rellena de una jugosa mezcla de carne sazonada con especias y condimentos que resaltan su sabor y le dan un toque irresistible.',
      tipoComida: TipoComida.desayuno),
  Comida(
      nombre: 'Huevos rancheros',
      imagenUrl: 'assets/images/huevos-rancheros.png',
      precio: 1.99,
      descripcion: '',
      tipoComida: TipoComida.desayuno),
  Comida(
      nombre: 'Pechuga al horno',
      imagenUrl: 'assets/images/pechuga-al-horno.png',
      precio: 4,
      descripcion: '',
      tipoComida: TipoComida.almuerzo),
  Comida(
      nombre: 'Filete de pescado',
      imagenUrl: 'assets/images/pescado.png',
      precio: 4,
      descripcion: '',
      tipoComida: TipoComida.almuerzo),
  Comida(
      nombre: 'Espaguetti',
      imagenUrl: 'assets/images/spaguetti.png',
      precio: 3,
      descripcion:
          'Los espaguetis se cocinan al dente para asegurar su textura perfecta, y luego se mezclan con nuestra salsa de tomate casera para crear una sinfonía de sabores en cada bocado.',
      tipoComida: TipoComida.merienda),
  Comida(
      nombre: 'Tortilla de papa',
      imagenUrl: 'assets/images/tortilladepapa.png',
      precio: 6,
      descripcion: '',
      tipoComida: TipoComida.merienda),
  Comida(
      nombre: 'Wafle de avena',
      imagenUrl: 'assets/images/wafleAvena.png',
      precio: 4,
      descripcion: '',
      tipoComida: TipoComida.desayuno),
];

var comidasdelDia = [
  Comida(
      nombre: 'Langostinos en salsa de vino',
      imagenUrl: 'assets/images/LangostinosSalsadevino.png',
      precio: 25,
      descripcion:
          'Imagina langostinos frescos y jugosos, cuidadosamente cocinados en una delicada salsa de vino que realza su sabor natural. Nuestra salsa de vino está elaborada con una cuidadosa selección de vinos finos, hierbas aromáticas y especias, que le confieren un sabor irresistible y equilibrado.',
      tipoComida: TipoComida.desayuno),
  Comida(
      nombre: 'Pan naan',
      imagenUrl: 'assets/images/pan-naam.png',
      precio: 14,
      descripcion:
          'Disfruta de nuestro pan naan acompañado de deliciosos currys, carnes jugosas o simplemente sumérgete en nuestros sabrosos dips.',
      tipoComida: TipoComida.desayuno),
  Comida(
      nombre: 'Cerdo en salsa',
      imagenUrl: 'assets/images/cerdoensalsa.png',
      precio: 18,
      descripcion:
          'Trozos de cerdo jugoso, cocinados a fuego lento en una deliciosa salsa, cuidadosamente preparada con una mezcla de especias y hierbas secretas que resaltan su sabor. Acompañamos este manjar con papas fritas crujientes y doradas, que complementan a la perfección la textura y el sabor del cerdo en salsa.',
      tipoComida: TipoComida.desayuno),
  Comida(
      nombre: 'Ostras asadas',
      imagenUrl: 'assets/images/ostrasAsadas.png',
      precio: 29.99,
      descripcion:
          'Nuestras ostras asadas son servidas con una exquisita combinación de ingredientes que realzan su frescura marina. Aromáticas hierbas, un toque de mantequilla y una pizca de limón se unen en perfecta armonía para brindarte una experiencia gustativa inolvidable.',
      tipoComida: TipoComida.desayuno),
];
