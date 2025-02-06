'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"version.json": "d7c4ef1a45c2dffc13a7e17bcf5cd02e",
"flutter_bootstrap.js": "3bf2958ab7560c0a99b35d85f2bff4bc",
"manifest.json": "430116821b2038711cc0e4ced8061a38",
"main.dart.js": "26ac13f12b78521cd0ec38d4ae0da5a4",
"index.html": "9fa83f53005c0aaac62daa8c212f8530",
"/": "9fa83f53005c0aaac62daa8c212f8530",
"assets/AssetManifest.json": "6d65f365a768c067ee408947917eec88",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "63f32d9a1b089ead1c432cedda263023",
"assets/AssetManifest.bin": "20a2569150b1003b18d13562c182257f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/FontManifest.json": "bdbe7df98579a5c1ce42bb3c6bb63a2f",
"assets/AssetManifest.bin.json": "9f57cbf454a38aa90edf0ed3810a8304",
"assets/NOTICES": "94ae70afbd562aeb632415d5ce0946cb",
"assets/assets/images/ahadith/ahadith4.jpg": "89ecc6908e235cc60ab80cc1f17897b0",
"assets/assets/images/ahadith/ahadith1.jpg": "c53e80f292aad3490fa612c35114a0d3",
"assets/assets/images/ahadith/ahadith5.jpg": "1b9bc505f649662ab608315e54faa2f0",
"assets/assets/images/ahadith/ahadith12.jpg": "6c7c393c9ba19467c4ebaa5bbb3a2572",
"assets/assets/images/ahadith/ahadith.jpg": "8b89fb111aeeb02be94c90c05a171f03",
"assets/assets/images/ahadith/ahadith7.jpg": "2b2f61a9bb426edc41c94a63cf07167a",
"assets/assets/images/ahadith/ahadith3.jpg": "ca47f96599189147384fe361f491b929",
"assets/assets/images/ahadith/ahadith8.jpg": "133ea6ae98c865f65c95a65c346b427e",
"assets/assets/images/ahadith/ahadith11.jpg": "beb20e9789495c566125f8212ae687a7",
"assets/assets/images/ahadith/ahadith2.jpg": "e2c7c7f5f496630cc12cc36998c2e7b7",
"assets/assets/images/ahadith/ahadith6.jpg": "211421e7e9d4661f24bd4e5f68115bc3",
"assets/assets/images/ahadith/ahadith9.jpg": "18f8c930cbd5ca69a8182949ad5e8a29",
"assets/assets/images/ahadith/ahadith10.jpg": "7616fd3b7203c8e7b6ae0c8c7ec72b22",
"assets/assets/images/ahadith/ahadith13.jpg": "74c060efebcf8fae75bcb066f3afee66",
"assets/assets/images/icons/linkedin.png": "ec3bc94d0930f898db4cfaa6bc5d9da2",
"assets/assets/images/icons/Vector.png": "8db7cb92bd896e3e77dc4fd033077543",
"assets/assets/images/icons/ahadith_icon.png": "f473ce3468a2cd412ed9ab1e0397ad22",
"assets/assets/images/bg/bage_bg.jpg": "a03bc793c19d760cf12ca45bf6ea63a2",
"assets/assets/images/bg/leaf_bg.jpg": "4ac0ff2a3210d9edb0397b1491227b51",
"assets/assets/images/bg/bg.jpg": "7b2af79e7fb32153e9f54ecc812aaddd",
"assets/assets/images/athkar/athkar.jpg": "64130c88ac50ad9fa1bd82ca8430c299",
"assets/assets/images/athkar/athkar1.jpg": "dfb8ef1ec8b8b2d63e0d2094a37542f0",
"assets/assets/images/athkar/athkar2.jpg": "04cadc62f67203e99623b14fee9e7e8c",
"assets/assets/images/athkar/athkar4.jpg": "b37618a6b20085fe0a4edbfe41502703",
"assets/assets/images/athkar/athkar3.jpg": "d8b6f3b560558921e1638896f13ea6ca",
"assets/assets/fonts/Raleway-Bold.ttf": "3b1a9a7b05c1e411253797b2fa3d1e91",
"assets/assets/fonts/Raleway-Thin.ttf": "b2a0b765ded79576d3bb4dbffc65550f",
"assets/assets/fonts/Raleway-Regular.ttf": "6e4a9679e65cc320746c3e5d48e51f28",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
