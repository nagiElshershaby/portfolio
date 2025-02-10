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
"flutter_bootstrap.js": "f404eab78c458afd158bf7cf09e11647",
"manifest.json": "430116821b2038711cc0e4ced8061a38",
"main.dart.js": "2e632889fe57c7dce019e78990a6f13d",
"index.html": "ac0c4e0c26b76432246be81e2ff6f6cd",
"/": "ac0c4e0c26b76432246be81e2ff6f6cd",
"assets/AssetManifest.json": "5a5f4d061483660a0955175c8bf22a61",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "5be69f0b8508ced769f7a329e367f890",
"assets/AssetManifest.bin": "dc76b4597a1265a1b0480e2115c49051",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/FontManifest.json": "bdbe7df98579a5c1ce42bb3c6bb63a2f",
"assets/AssetManifest.bin.json": "61bc5967c3b0b7251159d43bb0591e4b",
"assets/NOTICES": "3e90404282d164217f720c9fef5e9b18",
"assets/assets/images/icons/app-store.png": "671cd61a346b8e679de2d8a6d4d44f4a",
"assets/assets/images/icons/google_play.png": "e478cf906a23e58a8ee6c2cd5198bdc0",
"assets/assets/images/icons/google-play.png": "5259b9895a279f9efc7fddc44d24e4d0",
"assets/assets/images/icons/linkedin.png": "ec3bc94d0930f898db4cfaa6bc5d9da2",
"assets/assets/images/icons/Vector.png": "8db7cb92bd896e3e77dc4fd033077543",
"assets/assets/images/icons/ahadith_icon.png": "f473ce3468a2cd412ed9ab1e0397ad22",
"assets/assets/images/bg/closet_bg.png": "bde767ee5d0cebda275e9c7a22378657",
"assets/assets/images/bg/lamha_bg.png": "dcf6caeb8b1fc013df194074241183ea",
"assets/assets/images/bg/ahadith_bg.png": "79eef63d281690a9415d0938b59d8022",
"assets/assets/images/bg/ill-vent_bg.png": "028592083e06443708de62228589800f",
"assets/assets/images/bg/rozemoon_bg.png": "26dae4df05f7c6cd29abe7fe67e4f2e8",
"assets/assets/images/bg/azkar_bg.png": "c390fd79c19318eaa1c271d370a5d299",
"assets/assets/images/bg/others_bg.png": "44ec563635cc9a4b6f4fee1977995e77",
"assets/assets/images/bg/zahra_bg.png": "5bb2ffb3d4844d4e0a4601d69e3cf96a",
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
