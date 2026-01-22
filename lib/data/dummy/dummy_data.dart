import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_category_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_category_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';
import '../../routes/routes.dart';
import '../../utils/constants/image_strings.dart';

class YDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: YImage.banner1,
      targetScreen: YRoutes.order,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner2,
      targetScreen: YRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner3,
      targetScreen: YRoutes.favourites,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner4,
      targetScreen: YRoutes.search,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner5,
      targetScreen: YRoutes.settings,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner6,
      targetScreen: YRoutes.userAddress,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner8,
      targetScreen: YRoutes.checkout,
      active: false,
    ),
  ];

  /// Brand ↔ Category relations
  static final List<BrandCategoryModel> brandCategories = [
    BrandCategoryModel(brandId: '1', categoryId: '1'), // Apple → Smartphone
    BrandCategoryModel(brandId: '2', categoryId: '1'), // Samsung → Smartphone
    BrandCategoryModel(brandId: '3', categoryId: '1'), // Xiaomi → Smartphone
  ];

  /// Product ↔ Category relations
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '002', categoryId: '1'),
    ProductCategoryModel(productId: '003', categoryId: '1'),
    ProductCategoryModel(productId: '004', categoryId: '1'),
  ];

  /// - List of all Categories
  static final List<CategoryModel> categories = [
    // Main Categories (Featured)
    CategoryModel(
      id: '1',
      image: YImage.phoneIcon,
      name: 'Smartphone',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: YImage.smartWatchIcon,
      name: 'Smartwatch',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: YImage.headphonesIcon,
      name: 'Headphones',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: YImage.powerBankIcon,
      name: 'PowerBanks',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: YImage.gameControllerIcon,
      name: 'GameControllers',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: YImage.coolingFanIcon,
      name: 'CoolingFans',
      isFeatured: true,
    ),

    // Smartphone Subcategories
    CategoryModel(
      id: '7',
      image: YImage.phoneIcon,
      name: 'Flagship Phones',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '8',
      image: YImage.phoneIcon,
      name: 'Gaming Phones',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '9',
      image: YImage.phoneIcon,
      name: 'Budget Phones',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '10',
      image: YImage.phoneIcon,
      name: 'Mid Range Phones',
      parentId: '1',
      isFeatured: false,
    ),

    // Smartwatch Subcategories
    CategoryModel(
      id: '11',
      image: YImage.smartWatchIcon,
      name: 'Fitness Tracker',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '12',
      image: YImage.smartWatchIcon,
      name: 'Heart Rate Smartwatch',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '13',
      image: YImage.smartWatchIcon,
      name: 'GPS Smart Watch',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '14',
      image: YImage.smartWatchIcon,
      name: 'Medical Alert Smart Watch',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '15',
      image: YImage.smartWatchIcon,
      name: 'Cellular Smart Watch',
      parentId: '2',
      isFeatured: false,
    ),

    // Headphones Subcategories
    CategoryModel(
      id: '16',
      image: YImage.headphonesIcon,
      name: 'Headphone',
      parentId: '3',
      isFeatured: false,
    ),
    CategoryModel(
      id: '17',
      image: YImage.headphonesIcon,
      name: 'Earphones',
      parentId: '3',
      isFeatured: false,
    ),

    // PowerBanks Subcategories
    CategoryModel(
      id: '18',
      image: YImage.powerBankIcon,
      name: 'Standard Power Bank',
      parentId: '4',
      isFeatured: false,
    ),
    CategoryModel(
      id: '19',
      image: YImage.powerBankIcon,
      name: 'Solar Power Bank',
      parentId: '4',
      isFeatured: false,
    ),
    CategoryModel(
      id: '20',
      image: YImage.powerBankIcon,
      name: 'Wireless Power Bank',
      parentId: '4',
      isFeatured: false,
    ),
    CategoryModel(
      id: '21',
      image: YImage.powerBankIcon,
      name: 'Accessories',
      parentId: '4',
      isFeatured: false,
    ),

    // GameControllers Subcategories
    CategoryModel(
      id: '22',
      image: YImage.gameControllerIcon,
      name: 'GamePads',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '23',
      image: YImage.gameControllerIcon,
      name: 'JoySticks',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '24',
      image: YImage.gameControllerIcon,
      name: 'Steering Wheels',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '25',
      image: YImage.gameControllerIcon,
      name: 'motion controllers',
      parentId: '5',
      isFeatured: false,
    ),

    // CoolingFans Subcategories
    CategoryModel(
      id: '26',
      image: YImage.coolingFanIcon,
      name: 'Colling Fans',
      parentId: '6',
      isFeatured: false,
    ),
  ];

  /// -- List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(
      id: '1',
      image: YImage.brandIphone,
      name: 'Apple',
      productsCount: 265,
      isFeatured: true,
    ),
    BrandModel(
      id: '2',
      image: YImage.brandSamsung,
      name: 'Samsung',
      productsCount: 265,
      isFeatured: true,
    ),
    BrandModel(
      id: '3',
      image: YImage.brandXiaomi,
      name: 'Xiaomi',
      productsCount: 265,
      isFeatured: true,
    ),
    BrandModel(
      id: '4',
      image: YImage.brandAsus,
      name: 'Asus',
      productsCount: 265,
      isFeatured: true,
    ),
  ];

  /// -- List of all Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Iphone 17 ProMax',
      productType: 'ProductType.variable',
      stock: 15,
      price: 1389,
      isFeatured: true,
      thumbnail: YImage.imageIphone17ProMaxOrange,
      description:
          'The Apple iPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance, and a premium aluminum build with Ceramic Shield. It features an advanced 48 MP Pro Fusion camera system with strong optical zoom and pro-level video capabilities, huge storage options up to 2 TB, and long battery life with fast charging support. The phone runs iOS 26 with Apple Intelligence and includes modern connectivity like 5G, Wi-Fi 7, and satellite SOS.',
      brand: BrandModel(
        id: '1',
        image: YImage.brandIphone,
        name: 'Apple',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        YImage.imageIphone17ProMaxOrange,
        YImage.imageIphone17ProMaxBlack,
        YImage.imageIphone17ProMaxWhite,
      ],
      salePrice: 1159,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Orange', 'Black', 'White'],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['256 GB', '512 GB', '1 TB', '2 TB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 20,
          price: 1389,
          salePrice: 1159,
          image: YImage.imageIphone17ProMaxOrange,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'Orange', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 1389,
          salePrice: 1159,
          image: YImage.imageIphone17ProMaxBlack,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'Black', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 15,
          price: 1389,
          salePrice: 1159,
          image: YImage.imageIphone17ProMaxWhite,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'White', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 8,
          price: 1619,
          salePrice: 1519,
          image: YImage.imageIphone17ProMaxOrange,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'Orange', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 6,
          price: 1619,
          salePrice: 1519,
          image: YImage.imageIphone17ProMaxBlack,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'Black', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 10,
          price: 1619,
          salePrice: 1519,
          image: YImage.imageIphone17ProMaxWhite,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'White', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 8,
          price: 1859,
          salePrice: 1759,
          image: YImage.imageIphone17ProMaxOrange,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'Orange', 'Storage': '1 TB'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 10,
          price: 1859,
          salePrice: 1759,
          image: YImage.imageIphone17ProMaxBlack,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'Black', 'Storage': '1 TB'},
        ),
        ProductVariationModel(
          id: '9',
          stock: 5,
          price: 1859,
          salePrice: 1759,
          image: YImage.imageIphone17ProMaxWhite,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'White', 'Storage': '1 TB'},
        ),
        ProductVariationModel(
          id: '10',
          stock: 8,
          price: 2299,
          salePrice: 2099,
          image: YImage.imageIphone17ProMaxOrange,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'Orange', 'Storage': '2 TB'},
        ),
        ProductVariationModel(
          id: '11',
          stock: 8,
          price: 2299,
          salePrice: 2099,
          image: YImage.imageIphone17ProMaxBlack,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'Black', 'Storage': '2 TB'},
        ),
        ProductVariationModel(
          id: '12',
          stock: 8,
          price: 2299,
          salePrice: 2099,
          image: YImage.imageIphone17ProMaxWhite,
          description:
              'IPhone 17 Pro Max is a flagship 2025 smartphone with a 6.9-inch Super Retina XDR OLED display, A19 Pro chip for top-tier performance.',
          attributeValues: {'Color': 'White', 'Storage': '2 TB'},
        ),
      ],
    ),
    ProductModel(
      id: '002',
      title: 'Samsung Galaxy S25 Ultra Titanium',
      productType: 'ProductType.variable',
      stock: 15,
      price: 1299,
      isFeatured: true,
      thumbnail: YImage.imageSamsungGalaxyS25UltraBlack,
      description:
          'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking. It has a quad-camera array headlined by a 200 MP main sensor, plus ultra-wide and dual telephoto lenses for versatile photography and video (up to 8K). Built with a titanium frame, Gorilla Armor 2 glass, and IP68 water/dust resistance, it also includes an S Pen, a 5000 mAh battery with fast wired/wireless charging, and runs Android 15 with One UI 7 and Galaxy AI features.',
      brand: BrandModel(
        id: '2',
        image: YImage.brandSamsung,
        name: 'Samsung',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        YImage.imageSamsungGalaxyS25UltraBlack,
        YImage.imageSamsungGalaxyS25UltraGrey,
        YImage.imageSamsungGalaxyS25UltraBlue,
        YImage.imageSamsungGalaxyS25UltraWhite,
      ],
      salePrice: 1159,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Black', 'Grey', 'Blue', 'White'],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['256 GB', '512 GB', '1 TB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 20,
          price: 1299,
          salePrice: 1159,
          image: YImage.imageSamsungGalaxyS25UltraBlack,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'Black', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 1299,
          salePrice: 1159,
          image: YImage.imageSamsungGalaxyS25UltraGrey,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'Grey', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 15,
          price: 1299,
          salePrice: 1159,
          image: YImage.imageSamsungGalaxyS25UltraBlue,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'Blue', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 15,
          price: 1299,
          salePrice: 1159,
          image: YImage.imageSamsungGalaxyS25UltraWhite,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'White', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 8,
          price: 1439,
          salePrice: 1339,
          image: YImage.imageSamsungGalaxyS25UltraBlack,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'Black', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 6,
          price: 1439,
          salePrice: 1339,
          image: YImage.imageSamsungGalaxyS25UltraGrey,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'Grey', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 10,
          price: 1439,
          salePrice: 1339,
          image: YImage.imageSamsungGalaxyS25UltraBlue,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'White', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 10,
          price: 1439,
          salePrice: 1339,
          image: YImage.imageSamsungGalaxyS25UltraWhite,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'White', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '9',
          stock: 8,
          price: 1539,
          salePrice: 1759,
          image: YImage.imageSamsungGalaxyS25UltraBlack,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'Black', 'Storage': '1 TB'},
        ),
        ProductVariationModel(
          id: '10',
          stock: 10,
          price: 1539,
          salePrice: 1759,
          image: YImage.imageSamsungGalaxyS25UltraGrey,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'Grey', 'Storage': '1 TB'},
        ),
        ProductVariationModel(
          id: '11',
          stock: 5,
          price: 1539,
          salePrice: 1759,
          image: YImage.imageSamsungGalaxyS25UltraBlue,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'Blue', 'Storage': '1 TB'},
        ),
        ProductVariationModel(
          id: '12',
          stock: 5,
          price: 1539,
          salePrice: 1759,
          image: YImage.imageSamsungGalaxyS25UltraWhite,
          description:
              'The Samsung Galaxy S25 Ultra is Samsung’s top-tier 2025 flagship Android smartphone with a 6.9-inch Dynamic LTPO AMOLED 2X 1440p display and a powerful Snapdragon 8 Elite chipset for fast performance and smooth multitasking.',
          attributeValues: {'Color': 'White', 'Storage': '1 TB'},
        ),
      ],
    ),
    ProductModel(
      id: '003',
      title: 'Xiaomi 17 ProMax',
      productType: 'ProductType.variable',
      stock: 15,
      price: 899,
      isFeatured: true,
      thumbnail: YImage.imageXiaomi17ProMaxWhite,
      description:
          'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets, quick controls, and selfies using the rear camera. It’s powered by the Qualcomm Snapdragon 8 Elite Gen 5 chipset with up to 16 GB RAM and 1 TB storage and runs Android 16 with HyperOS 3. The phone has a triple Leica-tuned 50 MP camera system with 5× optical zoom, a massive 7,500 mAh battery with 100 W wired and 50 W wireless charging, IP68 water resistance, and modern connectivity like 5G and Wi-Fi 7 — all in a premium glass and metal build.',
      brand: BrandModel(
        id: '3',
        image: YImage.brandXiaomi,
        name: 'Xiaomi',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        YImage.imageXiaomi17ProMaxWhite,
        YImage.imageXiaomi17ProMaxBlue,
        YImage.imageXiaomi17ProMaxPurple,
        YImage.imageXiaomi17ProMaxGreen,
      ],
      salePrice: 799,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['White', 'Blue', 'Purple', 'Green'],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['256 GB', '512 GB', '1 TB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 20,
          price: 999,
          salePrice: 949,
          image: YImage.imageXiaomi17ProMaxWhite,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'White', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 999,
          salePrice: 949,
          image: YImage.imageXiaomi17ProMaxBlue,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'Blue', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 15,
          price: 999,
          salePrice: 949,
          image: YImage.imageXiaomi17ProMaxPurple,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'Purple', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 15,
          price: 999,
          salePrice: 949,
          image: YImage.imageXiaomi17ProMaxGreen,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'Green', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 8,
          price: 1039,
          salePrice: 989,
          image: YImage.imageXiaomi17ProMaxWhite,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'White', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 6,
          price: 1039,
          salePrice: 989,
          image: YImage.imageXiaomi17ProMaxBlue,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'Blue', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 10,
          price: 1039,
          salePrice: 989,
          image: YImage.imageXiaomi17ProMaxPurple,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'Purple', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 10,
          price: 1039,
          salePrice: 989,
          image: YImage.imageXiaomi17ProMaxGreen,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'Green', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '9',
          stock: 8,
          price: 1139,
          salePrice: 1069,
          image: YImage.imageXiaomi17ProMaxWhite,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'White', 'Storage': '1 TB'},
        ),
        ProductVariationModel(
          id: '10',
          stock: 10,
          price: 1139,
          salePrice: 1069,
          image: YImage.imageXiaomi17ProMaxBlue,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'Blue', 'Storage': '1 TB'},
        ),
        ProductVariationModel(
          id: '11',
          stock: 5,
          price: 1139,
          salePrice: 1069,
          image: YImage.imageXiaomi17ProMaxPurple,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'Purple', 'Storage': '1 TB'},
        ),
        ProductVariationModel(
          id: '12',
          stock: 5,
          price: 1139,
          salePrice: 1069,
          image: YImage.imageXiaomi17ProMaxGreen,
          description:
              'The Xiaomi 17 Pro Max is a premium flagship Android smartphone with a large 6.9-inch LTPO AMOLED 2K display featuring up to 3,500 nits brightness and a 2.9-inch secondary screen on the back for widgets.',
          attributeValues: {'Color': 'Green', 'Storage': '1 TB'},
        ),
      ],
    ),
    ProductModel(
      id: '004',
      title: 'Redmi Turbo 4 Pro',
      productType: 'ProductType.variable',
      stock: 15,
      price: 459,
      isFeatured: true,
      thumbnail: YImage.imageRedmiTurbo4ProHarryPotterEdition,
      description:
          'The Redmi Turbo 4 Pro is a powerful mid- to upper-range Android smartphone featuring a 6.83-inch 1.5K OLED display with a 120 Hz refresh rate and vibrant colors. It’s powered by the Qualcomm Snapdragon 8s Gen 4 chipset with up to 16 GB RAM and 1 TB storage, and runs Android 15 with HyperOS 2. The phone has a dual rear camera headlined by a 50 MP main sensor with OIS plus an 8 MP ultra-wide, and a 20 MP selfie camera. A standout feature is its massive 7,550 mAh battery with 90 W fast charging and reverse charging support. It also offers 5G, Wi-Fi, NFC, in-display fingerprint, and strong dust/water resistance.',
      brand: BrandModel(
        id: '3',
        image: YImage.brandXiaomi,
        name: 'Xiaomi',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        YImage.imageRedmiTurbo4ProHarryPotterEdition,
        YImage.imageRedmiTurbo4ProBlack,
        YImage.imageRedmiTurbo4ProWhite,
        YImage.imageRedmiTurbo4ProGreen,
      ],
      salePrice: 0,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Red', 'Black', 'White', 'Green'],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['256 GB', '512 GB', '1 TB'],
        ),
      ],
      productVariations: [
        // ===== 256 GB =====
        ProductVariationModel(
          id: '1',
          stock: 20,
          price: 349,
          salePrice: 349,
          image: YImage.imageRedmiTurbo4ProHarryPotterEdition,
          description:
              'The Redmi Turbo4Pro HarryPotter Edition is a special themed version of the Redmi Turbo 4 Pro smartphone designed for fans of the Harry Potter franchise.',
          attributeValues: {'Color': 'Red', 'Storage': '512 GB'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 259,
          salePrice: 259,
          image: YImage.imageRedmiTurbo4ProBlack,
          description:
              'The Redmi Turbo 4 Pro is a powerful mid- to upper-range Android smartphone featuring a 6.83-inch 1.5K OLED display with a 120 Hz refresh rate and vibrant colors.',
          attributeValues: {'Color': 'Black', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 15,
          price: 259,
          salePrice: 259,
          image: YImage.imageRedmiTurbo4ProWhite,
          description:
              'The Redmi Turbo 4 Pro is a powerful mid- to upper-range Android smartphone featuring a 6.83-inch 1.5K OLED display with a 120 Hz refresh rate and vibrant colors.',
          attributeValues: {'Color': 'White', 'Storage': '256 GB'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 12,
          price: 259,
          salePrice: 259,
          image: YImage.imageRedmiTurbo4ProGreen,
          description:
              'The Redmi Turbo 4 Pro is a powerful mid- to upper-range Android smartphone featuring a 6.83-inch 1.5K OLED display with a 120 Hz refresh rate and vibrant colors.',
          attributeValues: {'Color': 'Green', 'Storage': '256 GB'},
        ),
      ],
    ),
  ];
}
