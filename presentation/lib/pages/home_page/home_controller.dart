import 'package:domain/modules/products/use_cases/get_all_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/view/product_view_model.dart';


class HomeController extends GetxController {
  final GetAllProductsUseCase getAllProductsUseCase= GetIt.instance<GetAllProductsUseCase>();


  RxList<BaseViewModel> items = RxList([]);
  RxList<ProductViewModel> products = RxList([]);
  RxBool isLoading=true.obs;
  List<ProductViewModel> newProducts = [];
  List<ProductViewModel> saleProducts = [];

  void getProducts() async {
    isLoading.value=true;
      await getAllProductsUseCase.getAll().then((products) {
        this.products.value = products.map((e) => e.toModel).toList();

        isLoading.value=false;
      });
  }

  void getNewProducts() {
    newProducts = products.where((product) => products.indexOf(product) % 2 == 0).toList();
  }

  void getSaleProducts() {
    saleProducts = products.where((product) => product.sale != 0).toList();
  }


  /*RxList<ProductViewModel> products = RxList([]);
  List<ProductViewModel> newProducts = [];
  List<ProductViewModel> saleProducts = [];

  //GetAllProductsUseCase.getAll();

  void initProduct() {
    products.value = [
      ProductViewModel(
        id: 1,
        title: "Wireless Headphones",
        company: "Sony",
        imageUrl: ["assets/products/headphones.jpeg",],
        marks: ["Best Seller", "Trending", "Noise Cancelling", "Long Battery Life", "Comfort Fit", "Bluetooth 5.0"],
        price: 299,
        sale: 10,
        description:
        "Experience superior sound with Sony's premium wireless noise-cancelling headphones. "
            "Designed for audiophiles and travelers, these headphones offer up to 30 hours of battery life, "
            "quick charging, touch controls, and industry-leading ANC for immersive listening. "
            "Ideal for music, work, or commuting.",
        specification: [
          Specification(title: "Bluetooth", value: "5.0"),
          Specification(title: "Noise Cancelling", value: "Yes"),
          Specification(title: "Battery Life", value: "30 Hours"),
          Specification(title: "Microphone", value: "Built-in"),
        ],
        category: [
          CategoryViewModel(
            title: "Electronics",
            subCategory: ["Headphones", "Audio Devices"],
          ),
          CategoryViewModel(
            title: "Accessories",
            subCategory: ["Wireless", "Gadgets"],
          ),
        ],
      ),
      ProductViewModel(
        id: 2,
        title: "Smartphone",
        company: "Samsung",
        imageUrl: ["assets/products/samsung-phone.jpeg"],
        marks: ["New Arrival", "Featured", "5G Enabled", "Pro Camera", "Fast Charging", "Water Resistant"],
        price: 999,
        sale: 20,
        description:
        "Samsung's latest flagship smartphone delivers cutting-edge performance with a powerful processor,"
            " vibrant AMOLED display, and a pro-grade multi-lens camera system."
            " Enjoy ultra-fast 5G, wireless charging, water resistance, and a sleek,"
            " modern design perfect for power users and content creators.",
        specification: [
          Specification(title: "Display", value: "6.8-inch"),
          Specification(title: "Processor", value: "Snapdragon"),
          Specification(title: "Camera", value: "108MP"),
          Specification(title: "Battery", value: "5000mAh"),
        ],
        category: [
          CategoryViewModel(
            title: "Mobile Phones",
            subCategory: ["Android", "Flagship"],
          ),
          CategoryViewModel(
            title: "Gadgets",
            subCategory: ["Smartphones"],
          ),
        ],
      ),
      ProductViewModel(
        id: 3,
        title: "Gaming Laptop",
        company: "Asus",
        imageUrl: ["assets/products/gaming-laptop.jpg"],
        marks: ["Top Rated", "Performance", "RGB Keyboard", "VR Ready", "SSD Storage", "Cooling System"],
        price: 1899,
        sale: 0,
        description:
        "Push the limits with this high-performance Asus gaming laptop featuring a dedicated NVIDIA GPU, "
            "high-refresh-rate display, and customizable RGB keyboard. Built for smooth gameplay and multitasking,"
            " it also excels at creative work like video editing and 3D rendering. "
            "Stay cool even during intense sessions with advanced thermal management.",
        specification: [
          Specification(title: "Processor", value: "Intel i9"),
          Specification(title: "RAM", value: "16GB"),
          Specification(title: "Storage", value: "1TB SSD"),
          Specification(title: "Graphics", value: "NVIDIA RTX 4080"),
        ],
        category: [
          CategoryViewModel(
            title: "Computers",
            subCategory: ["Laptops", "Gaming"],
          ),
        ],
      ),
      ProductViewModel(
        id: 4,
        title: "Smartwatch",
        company: "Apple",
        imageUrl: ["assets/products/smartwatch.jpeg"],
        marks: ["Trending", "Best Seller", "Health Monitor", "Water Resistant", "Fitness Tracker", "Always-On Display"],
        price: 399,
        sale: 0,
        description:
        "The Apple Watch is your all-day fitness coach, health tracker, and notification hub. "
            "Monitor your heart rate, track workouts, use GPS, "
            "and stay connected with calls and messages—all from your wrist. "
            "Sleek design, swim-proof build, and compatibility with iPhone make it a must-have smart accessory.",
        specification: [
          Specification(title: "Heart Rate Monitor", value: "Yes"),
          Specification(title: "GPS", value: "Built-in"),
          Specification(title: "Water Resistant", value: "Yes"),
          Specification(title: "Display", value: "OLED"),
        ],
        category: [
          CategoryViewModel(
            title: "Electronics",
            subCategory: ["Wearables", "Smart Devices"],
          ),
          CategoryViewModel(
            title: "Fashion",
            subCategory: ["Accessories"],
          ),
        ],
      ),
      ProductViewModel(
        id: 5,
        title: "4K TV",
        company: "LG",
        imageUrl: ["assets/products/4k-tv.jpg"],
        marks: ["New Arrival", "Smart TV", "HDR", "Ultra HD", "Voice Control", "Thin Bezel"],
        price: 1200,
        sale: 15,
        description:
        "Bring cinema-quality visuals to your living room with this LG 4K Ultra HD TV. "
            "Enjoy lifelike clarity, vivid colors, and deep contrast with HDR10 support. "
            "Smart TV functionality offers seamless streaming from your favorite apps, "
            "while voice control and a sleek bezel-less design enhance your viewing experience.",
        specification: [
          Specification(title: "Screen Size", value: "65-inch"),
          Specification(title: "HDR", value: "HDR10+"),
          Specification(title: "Smart Features", value: "Yes"),
          Specification(title: "HDMI Ports", value: "4"),
        ],
        category: [
          CategoryViewModel(
            title: "Electronics",
            subCategory: ["TV & Video"],
          ),
          CategoryViewModel(
            title: "Home Appliances",
            subCategory: ["Entertainment"],
          ),
        ],
      ),
      ProductViewModel(
        id: 6,
        title: "Bluetooth Speaker",
        company: "JBL",
        imageUrl: ["assets/products/jbl.jpg"],
        marks: ["Popular", "Affordable", "Portable", "Waterproof", "Deep Bass", "Long Battery Life"],
        price: 99,
        sale: 0,
        description:
        "Take your music anywhere with the JBL portable Bluetooth speaker. "
            "Compact but powerful, it delivers punchy bass, clear audio, "
            "and up to 12 hours of playtime. With IPX7 waterproofing, it's perfect for the beach, "
            "poolside, or outdoor adventures. Easy pairing and USB-C charging make it even more convenient.",
        specification: [
          Specification(title: "Bluetooth Version", value: "5.1"),
          Specification(title: "Battery Life", value: "12 Hours"),
          Specification(title: "Waterproof", value: "Yes"),
          Specification(title: "Design", value: "Compact"),
        ],
        category: [
          CategoryViewModel(
            title: "Electronics",
            subCategory: ["Audio Devices", "Speakers"],
          ),
          CategoryViewModel(
            title: "Accessories",
            subCategory: ["Portable Devices"],
          ),
        ],
      ),
      ProductViewModel(
        id: 7,
        title: "DSLR Camera",
        company: "Canon",
        imageUrl: ["assets/products/camera.jpeg"],
        marks: [
          "Best Seller",
          "Professional",
          "High Resolution",
          "Interchangeable Lenses",
          "4K Video",
          "Wi-Fi Enabled"
        ],
        price: 1500,
        sale: 30,
        description:
        "Capture stunning, detailed photos with this professional-grade Canon DSLR camera. "
            "Equipped with a high-resolution sensor, fast autofocus, and full manual controls, "
            "it’s perfect for both seasoned photographers and ambitious beginners. "
            "Supports a wide range of EF lenses and advanced features like 4K video, "
            "Wi-Fi sharing, and dual-pixel autofocus.",
        specification: [
          Specification(title: "Resolution", value: "24.1MP APS-C"),
          Specification(title: "Processor", value: "DIGIC 8"),
          Specification(title: "Video", value: "4K Recording"),
          Specification(title: "Connectivity", value: "Wi-Fi"),
        ],
        category: [
          CategoryViewModel(
            title: "Electronics",
            subCategory: ["Cameras", "Photography"],
          ),
        ],
      ),
      ProductViewModel(
        id: 8,
        title: "Microwave Oven",
        company: "Panasonic",
        imageUrl: ["assets/products/microwave.jpg"],
        marks: ["Reliable", "Energy Efficient", "Compact Design", "Easy to Use", "Multi-Cook Modes", "Even Heating"],
        price: 250,
        sale: 0,
        description:
        "This Panasonic microwave oven is a dependable kitchen companion, featuring multiple cooking presets, "
            "inverter technology for even heating, and a space-saving design. "
            "With intuitive controls and a durable stainless steel finish, "
            "it’s ideal for everyday use—from reheating to full meal preparation.",
        specification: [
          Specification(title: "Power", value: "800W"),
          Specification(title: "Cooking Programs", value: "10"),
          Specification(title: "Child Lock", value: "Yes"),
          Specification(title: "Interior", value: "Easy Clean"),
        ],
        category: [
          CategoryViewModel(
            title: "Home Appliances",
            subCategory: ["Microwaves", "Kitchen"],
          ),
        ],
      ),
      ProductViewModel(
        id: 9,
        title: "Running Shoes",
        company: "Nike",
        imageUrl: ["assets/products/shoes.jpg"],
        marks: ["Top Rated", "Comfort", "Breathable", "Durable", "Lightweight", "Ergonomic Design"],
        price: 120,
        sale: 0,
        description: "These Nike running shoes are engineered for performance and comfort. "
            "Lightweight and breathable, they feature responsive foam cushioning and a "
            "flexible outsole for smooth motion. Ideal for training, jogging, or daily wear, "
            "they combine high-end support with modern style and lasting durability.",
        specification: [
          Specification(title: "Material", value: "Breathable Mesh"),
          Specification(title: "Sole", value: "Cushioned"),
          Specification(title: "Outsole", value: "Rubber"),
          Specification(title: "Colors", value: "Multiple"),
        ],
        category: [
          CategoryViewModel(
            title: "Fashion",
            subCategory: ["Men", "Sportswear"],
          ),
        ],
      ),
      ProductViewModel(
        id: 10,
        title: "Electric Kettle",
        company: "Philips",
        imageUrl: [
          "assets/products/electric-kettle.jpg",
          "assets/products/electric-kettle1.jpg",
          "assets/products/electric-kettle2.jpg",
        ],
        marks: ["Energy Saver", "Popular", "Auto Shut-off", "Fast Boil", "Cool Touch", "Cordless Base"],
        price: 45,
        sale: 10,
        description:
        "Boil water quickly and safely with the Philips electric kettle. Designed for efficiency and safety, "
            "it features fast boil technology, automatic shut-off, and a cordless 360° base for convenience. "
            "Cool-touch exterior and BPA-free construction make it perfect for any modern kitchen.",
        specification: [
          Specification(title: "Capacity", value: "1.7L"),
          Specification(title: "Body", value: "Stainless Steel"),
          Specification(title: "Auto Shut-Off", value: "Yes"),
          Specification(title: "Design", value: "Cordless"),
        ],
        category: [
          CategoryViewModel(
            title: "Home Appliances",
            subCategory: ["Kitchen"],
          ),
        ],
      ),
    ];
  }

  void getNewProducts() {
    newProducts = products.where((product) => products.indexOf(product) % 2 == 0).toList();
  }

  void getSaleProducts() {
    saleProducts = products.where((product) => product.sale != 0).toList();
  }*/
}
