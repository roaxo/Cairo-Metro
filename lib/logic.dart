import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

final stations = [
  //DropDown List
  'New Marg',
  'El-Marg',
  'Ain Shams',
  'El-Matareyya',
  'Helmeyet El-Zaitoun',
  'Hadayeq El-Zaitoun',
  'Saray El-Qobba',
  'Hamamat El-Qobba',
  'Kobri El-Qobba',
  'Mansheyet El-Sadr',
  'El-Dmerdash',
  'Ghamra',
  'Al-Shohadaa', // transfer
  'Orabi',
  'Nasser', // transfer
  'Sadat', // transfer
  'Saad Zaghloul',
  'Sayeda Zeinab',
  'El-Malek El-Saleh',
  'Mar Girgis',
  'El-Zahraa',
  'Dar El-Salam',
  'Hadayeq El-Maadi',
  'Maadi',
  'Saakenat El-Maadi',
  'Tora El-Balad',
  'Kozzika',
  'Tora El-Asmant',
  'El-Maasara',
  'Hadayeq Helwan',
  'Wadi Hof',
  'Helwan University',
  'Ain Helwan',
  'Helwan',

  'Shoubra El-Kheima',
  'Koliet El-Zeraa',
  'Mezallat',
  'Khalafawy',
  'St. Teresa',
  'Road El-Farag',
  'Masarra',
  'Attaba', // transfer
  'Mohamed Naguib',
  'Opera',
  'Dokki',
  'El-Bohoth',
  'Cairo University',
  'Faisal',
  'Giza',
  'Omm El-Masryeen',
  'Sakiat Mekky',
  'El-Mounib',

  'Adly Mansour',
  'Haykestep',
  'Omar Ibn El-Khattab',
  'Qobaa',
  'Hisham Barakat',
  'El-Nozha',
  'El-Shams Club',
  'Alf Maskan',
  'Heliopolis',
  'Haroun',
  'Al-Ahram',
  'Koliet El-Banat',
  'Stadium',
  'Fair Zone',
  'Abbassiya',
  'Abdou Pasha',
  'El-Geish',
  'Bab El-Shaariya',
  'Maspero',
  'Safaa Hegazy',
  'Kit Kat',
  'Sudan',
  'Imbaba',
  'El-Bohy',
  'El-Qawmia',
  'Ring Road',
  'Tawfikia',
  'Wadi El-Nile',
  'Gamet El-Dowal',
];

final Map<String, List<String>> metroGraph = {
  //route
  // ---------------- Line 1 (Red) ----------------
  "Helwan": ["Ain Helwan"],
  "Ain Helwan": ["Helwan", "Helwan University"],
  "Helwan University": ["Ain Helwan", "Wadi Hof"],
  "Wadi Hof": ["Helwan University", "Hadayeq Helwan"],
  "Hadayeq Helwan": ["Wadi Hof", "El-masraa"],
  "El-masraa": ["Hadayeq Helwan", "Tura El-Esmant"],
  "Tura El-Esmant": ["El-masraa", "Kozzika"],
  "Kozzika": ["Tura El-Esmant", "Tora El-Balad"],
  "Tora El-Balad": ["Kozzika", "Sakanat El-Maadi"],
  "Sakanat El-Maadi": ["Tora El-Balad", "Maadi"],
  "Maadi": ["Sakanat El-Maadi", "Hadayek El-Maadi"],
  "Hadayek El-Maadi": ["Maadi", "Dar El-Salam"],
  "Dar El-Salam": ["Hadayek El-Maadi", "El-Zahraa"],
  "El-Zahraa": ["Dar El-Salam", "Mar Girgis"],
  "Mar Girgis": ["El-Zahraa", "El-Malek El-Saleh"],
  "El-Malek El-Saleh": ["Mar Girgis", "Al-Sayeda Zeinab"],
  "Al-Sayeda Zeinab": ["El-Malek El-Saleh", "Saad Zaghloul"],
  "Saad Zaghloul": ["Al-Sayeda Zeinab", "Sadat"],
  "Sadat": [
    "Saad Zaghloul",
    "Nasser",
    "Opera",
    "Mohamed Naguib",
  ], // transfer (L1 <-> L2)
  "Nasser": [
    "Sadat",
    "Orabi",
    "Attaba",
    "Maspero",
  ], // transfer (L1 <-> L2 <-> L3)
  "Orabi": ["Nasser", "Al-Shohadaa"],
  "Al-Shohadaa": [
    "Orabi",
    "Ghamra",
    "Massara",
    "Attaba",
  ], // transfer (L1 <-> L2 <-> L3)
  "Ghamra": ["Al-Shohadaa", "El-Dmerdash"],
  "El-Dmerdash": ["Ghamra", "Manshiet El-Sadr"],
  "Manshiet El-Sadr": ["El-Demerdash", "Kobri El-Qobba"],
  "Kobri El-Qobba": ["Manshiet El-Sadr", "Hammamat El-Qobba"],
  "Hammamat El-Qobba": ["Kobri El-Qobba", "Saray El-Qobba"],
  "Saray El-Qobba": ["Hammamat El-Qobba", "Hadayeq El-Zaitoun"],
  "Hadayeq El-Zaitoun": ["Saray El-Qobba", "Helmeyet El-Zaitoun"],
  "Helmeyet El-Zaitoun": ["Hadayeq El-Zaitoun", "El-Matareyya"],
  "El-Matareyya": ["Helmeyet El-Zaitoun", "Ain Shams"],
  "Ain Shams": ["El-Matareyya", "Ezbet El-Nakhl"],
  "Ezbet El-Nakhl": ["Ain Shams", "El-Marg"],
  "El-Marg": ["Ezbet El-Nakhl", "New Marg"],
  "New Marg": ["El-Marg"],

  // ---------------- Line 2 (Dark Green) ----------------
  "Shubra Al Khaimah": ["Koliet El-Zeraa"],
  "Koliet El-Zeraa": ["Shubra Al Khaimah", "Mezallat"],
  "Mezallat": ["Koliet El-Zeraa", "Khalafawy"],
  "Khalafawy": ["Mezallat", "St. Teresa"],
  "St. Teresa": ["Khalafawy", "Rod El-Farag"],
  "Rod El-Farag": ["St. Teresa", "Massara"],
  "Massara": ["Rod El-Farag", "Al-Shohadaa"],
  "Opera": ["Sadat", "Dokki"],
  "Dokki": ["Opera", "El-Bohooth"],
  "El-Bohooth": ["Dokki", "Cairo University"],
  "Cairo University": ["El-Bohooth", "Faisal", "Boulak El-Dakrour"],
  "Faisal": ["Cairo University", "Giza"],
  "Giza": ["Faisal", "Omm El-Masryeen"],
  "Omm El-Masryeen": ["Giza", "Sakiat Mekky"],
  "Sakiat Mekky": ["Omm El-Masryeen", "El Monib"],
  "El Monib": ["Sakiat Mekky"],

  // ---------------- Line 3 (Light Green) ----------------
  "Adly Mansour": ["Haykstep"],
  "Haykstep": ["Adly Mansour", "Omar Ibn El-Khattab"],
  "Omar Ibn El-Khattab": ["Haykstep", "Qubaa"],
  "Qubaa": ["Omar Ibn El-Khattab", "Hesham Barakat"],
  "Hesham Barakat": ["Qubaa", "El-Nozha"],
  "El-Nozha": ["Hesham Barakat", "El-Shams Club"],
  "El-Shams Club": ["El-Nozha", "Alf Maskan"],
  "Alf Maskan": ["El-Shams Club", "Heliopolis"],
  "Heliopolis": ["Alf Maskan", "Haroun"],
  "Haroun": ["Heliopolis", "Al-Ahram"],
  "Al Ahram": ["Haroun", "Koleyet El-Banat"],
  "Koleyet El-Banat": ["Al-Ahram", "Stadium"],
  "Stadium": ["Koleyet El-Banat", "Fair Zone"],
  "Fair Zone": ["Stadium", "Abbasiya"],
  "Abbasiya": ["Fair Zone", "Abdou Pasha"],
  "Abdou Pasha": ["Abbasiya", "El-Geish"],
  "El-Geish": ["Abdou Pasha", "Bab El-Shaariya"],
  "Bab El-Shaariya": ["El-Geish", "Attaba"],
  "Attaba": ["Bab El-Shaariya", "Nasser", "Al-Shohadaa"], // transfer

  "Maspero": ["Nasser", "Sefaa Hijazy"],
  "Sefaa Hijazy": ["Maspero", "Kit Kat"],
  "Kit Kat": ["Sefaa Hijazy", "Sudan", "Tawfikia"],
  "Sudan": ["Kit Kat", "Imbaba"],
  "Imbaba": ["Sudan", "El Bohy"],
  "El-Bohy": ["Imbaba", "El-Qawmia"],
  "El-Qawmia": ["El-Bohy", "Ring Road"],
  "Ring Road": ["El-Qawmia", "Road El-Farag"],
  "Road El-Farag": ["Ring Road"],
  "Tawfikia": ["Kit Kat", "Wadi El-Nile"],
  "Wadi El-Nile": ["Tawfikia", "Gamet El-Dowel"],
  "Gamet El-Dowel": ["Wadi El-Nile", "Boulak El-Dakrour"],
  "Boulak El-Dakrour": ["Gamet El-Dowel", "Cairo University"],
};

List<String> findShortestPath(String start, String end) {
  final queue = <List<String>>[];
  final visited = <String>{};

  queue.add([start]);

  while (queue.isNotEmpty) {
    final path = queue.removeAt(0);
    final station = path.last;

    if (station == end) {
      return path; // shortest path found
    }

    if (!visited.contains(station)) {
      visited.add(station);
      for (var neighbor in metroGraph[station] ?? []) {
        final newPath = List<String>.from(path)..add(neighbor);
        queue.add(newPath);
      }
    }
  }

  return [];
}

final Map<String, Map<String, double>> stationCoordinates = {
  // Line 1
  'New Marg': {'lat': 30.16382958347747, 'lng': 31.338262275847267},
  'El-Marg': {'lat': 30.15238684622937, 'lng': 31.335671270761413},
  'Ain Shams': {'lat': 30.13094682716343, 'lng': 31.319697479164677},
  'El-Matareyya': {'lat': 30.12313687929955, 'lng': 31.31344586234033},
  'Helmeyet El-Zaitoun': {'lat': 30.113401866774176, 'lng': 31.313934262572044},
  'Hadayeq El-Zaitoun': {'lat': 30.106724932768707, 'lng': 31.31050475686312},
  'Saray El-Qobba': {'lat': 30.100011038698476, 'lng': 31.30579511624027},
  'Hamamat El-Qobba': {'lat': 30.09144526481484, 'lng': 31.29887364891409},
  'Kobri El-Qobba': {'lat': 30.089916703700403, 'lng': 31.29516970908747},
  'Mansheyet El-Sadr': {'lat': 30.084148049542357, 'lng': 31.287669421685496},
  'El-Dmerdash': {'lat': 30.08162415712426, 'lng': 31.27746069055945},
  'Ghamra': {'lat': 30.069312191309745, 'lng': 31.26456852024219},
  'Al-Shohadaa': {'lat': 30.090327214140366, 'lng': 31.243983199863905},
  'Orabi': {'lat': 30.061348209154268, 'lng': 31.24173699931107},
  'Nasser': {'lat': 30.05670498161162, 'lng': 31.239298485358244},
  'Sadat': {'lat': 30.04762895359591, 'lng': 31.235153011638435},
  'Saad Zaghloul': {'lat': 30.036661337908278, 'lng': 31.24041206132938},
  'Sayeda Zeinab': {'lat': 30.02949599553601, 'lng': 31.235436164315654},
  'El-Malek El-Saleh': {'lat': 30.022193971700432, 'lng': 31.230607420276524},
  'Mar Girgis': {'lat': 30.006391462078458, 'lng': 31.229580520242173},
  'El-Zahraa': {'lat': 30.001467428262007, 'lng': 31.23197518046717},
  'Dar El-Salam': {'lat': 29.982195595214392, 'lng': 31.242176120045375},
  'Hadayeq El-Maadi': {'lat': 29.97031514326411, 'lng': 31.250580677912325},
  'Maadi': {'lat': 29.960326037894514, 'lng': 31.257755752566492},
  'Saakenat El-Maadi': {'lat': 29.953092664759573, 'lng': 31.263411735358932},
  'Tora El-Balad': {'lat': 29.94692598728903, 'lng': 31.27294244887747},
  'Kozzika': {'lat': 29.93641240707538, 'lng': 31.28178304893583},
  'Tora El-Asmant': {'lat': 29.926109224604136, 'lng': 31.287560493252602},
  'El-Maasara': {'lat': 29.906269054440056, 'lng': 31.299467520242196},
  'Hadayeq Helwan': {'lat': 29.89706159125901, 'lng': 31.305768641443475},
  'Wadi Hof': {'lat': 29.879173978773654, 'lng': 31.31359942190372},
  'Helwan University': {'lat': 29.87075390152713, 'lng': 31.320109814018974},
  'Ain Helwan': {'lat': 29.863223180663592, 'lng': 31.32459644950882},
  'Helwan': {'lat': 29.85121530734333, 'lng': 31.331312648758807},

  // Line 2
  'Shoubra El-Kheima': {'lat': 30.121015595319687, 'lng': 31.241368427682247},
  'Koliet El-Zeraa': {'lat': 30.113863594308746, 'lng': 31.248707450922748},
  'Mezallat': {'lat': 30.108324607375437, 'lng': 31.246610645282583},
  'Khalafawy': {'lat': 30.098076786261196, 'lng': 31.24539906419105},
  'St. Teresa': {'lat': 30.089456125166222, 'lng': 31.24538004703},
  'Road El-Farag': {'lat': 30.084148049128757, 'lng': 31.24537612778435},
  'Masarra': {'lat': 30.072210298331854, 'lng': 31.245012735369826},
  'Attaba': {'lat': 30.05607179734745, 'lng': 31.24612632442615},
  'Mohamed Naguib': {'lat': 30.047840033461824, 'lng': 31.24490706744974},
  'Opera': {'lat': 30.04551813019677, 'lng': 31.225155104431852},
  'Dokki': {'lat': 30.03861132493187, 'lng': 31.21217962004636},
  'El-Bohoth': {'lat': 30.038529037284064, 'lng': 31.200245227452427},
  'Cairo University': {'lat': 30.031667520341664, 'lng': 31.201200576177634},
  'Faisal': {'lat': 30.01752092603626, 'lng': 31.203935848875496},
  'Giza': {'lat': 30.011598499386192, 'lng': 31.206054793651603},
  'Omm El-Masryeen': {'lat': 30.00568965539201, 'lng': 31.20811473001284},
  'Sakiat Mekky': {'lat': 29.99543195859973, 'lng': 31.20871554472932},
  'El-Mounib': {'lat': 29.98106142085157, 'lng': 31.212139325901088},

  // Line 3
  'Adly Mansour': {'lat': 30.147281290295, 'lng': 31.421213706603986},
  'Haykestep': {'lat': 30.144036919788082, 'lng': 31.404616533535226},
  'Omar Ibn El-Khattab': {'lat': 30.140390626125722, 'lng': 31.394370495416798},
  'Qobaa': {'lat': 30.13487917841427, 'lng': 31.3837704052495},
  'Hisham Barakat': {'lat': 30.130861380352613, 'lng': 31.373009382699557},
  'El-Nozha': {'lat': 30.1279383990858, 'lng': 31.36012405067312},
  'El-Shams Club': {'lat': 30.125507155086037, 'lng': 31.34891241697801},
  'Alf Maskan': {'lat': 30.118890527626057, 'lng': 31.33988946568278},
  'Heliopolis': {'lat': 30.1084032396219, 'lng': 31.338323055716003},
  'Haroun': {'lat': 30.101386343937495, 'lng': 31.332969366629086},
  'Al-Ahram': {'lat': 30.091723374600775, 'lng': 31.326296030575307},
  'Koliet El-Banat': {'lat': 30.084120432374036, 'lng': 31.329064070179772},
  'Stadium': {'lat': 30.072923826988283, 'lng': 31.31716579121125},
  'Fair Zone': {'lat': 30.073202364875858, 'lng': 31.30097597754198},
  'Abbassiya': {'lat': 30.071967507578492, 'lng': 31.283487974735202},
  'Abdou Pasha': {'lat': 30.064845887076302, 'lng': 31.274786888630562},
  'El-Geish': {'lat': 30.061753811482752, 'lng': 31.266911923048877},
  'Bab El-Shaariya': {'lat': 30.058604510108925, 'lng': 31.25539267744689},
  'Maspero': {'lat': 30.05902662260366, 'lng': 31.232470646290334},
  'Safaa Hegazy': {'lat': 30.062499656311832, 'lng': 31.222628521898777},
  'Kit Kat': {'lat': 30.066632325064447, 'lng': 31.212934086770662},
  'Sudan': {'lat': 30.070256339782812, 'lng': 31.204679991544584},
  'Imbaba': {'lat': 30.08252555451907, 'lng': 31.206416301557436},
  'El-Bohy': {'lat': 30.082170978748493, 'lng': 31.210554242037645},
  'El-Qawmia': {'lat': 30.093245862399684, 'lng': 31.20920240872974},
  'Ring Road': {'lat': 30.096531884279145, 'lng': 31.199460625736986},
  'Tawfikia': {'lat': 30.065300434666028, 'lng': 31.202105578003312},
  'Wadi El-Nile': {'lat': 30.057273493328275, 'lng': 31.201217472484537},
  'Gamet El-Dowal': {'lat': 30.050141528944934, 'lng': 31.199050247649957},
};

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

Future<Map<String, dynamic>?> getClosestStation() async {
  Position position = await _determinePosition();

  double userLat = position.latitude;
  double userLng = position.longitude;

  String? closestStation;
  double minDistance = double
      .infinity; //sets in to a large number Then when I check the first station, its distance will always be smaller than infinity.

  stationCoordinates.forEach((station, coords) {
    double lat = coords['lat']!;
    double lng = coords['lng']!;

    double distance = Geolocator.distanceBetween(userLat, userLng, lat, lng);

    if (distance < minDistance) {
      minDistance = distance;
      closestStation = station;
    }
  });

  if (closestStation == null) return null;

  return {
    "station": closestStation,
    "distance": minDistance, // in meters
  };
}

Future<Map<String, dynamic>?> getClosestStationFromAdd(String address) async {
  try {
    List<Location> locations = await locationFromAddress(address);

    if (locations.isEmpty) return null;

    double userLat = locations.first.latitude;
    double userLng = locations.first.longitude;
    String? closestStation;
    double minDistance = double.infinity;

    stationCoordinates.forEach((station, coords) {
      double lat = coords['lat']!;
      double lng = coords['lng']!;

      double distance = Geolocator.distanceBetween(userLat, userLng, lat, lng);

      if (distance < minDistance) {
        minDistance = distance;
        closestStation = station;
      }
    });

    if (closestStation == null) return null;

    return {
      "station": closestStation,
      "distance": minDistance, // in meters
    };
  } catch (e) {
    return {"error": e.toString()};
  }
}
