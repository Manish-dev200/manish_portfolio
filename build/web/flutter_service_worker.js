'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "ee9352c172c7cd249b620d4decc5e788",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "36ec30462d1790ff526c67437e3c4d6b",
"/": "36ec30462d1790ff526c67437e3c4d6b",
"manish_profile_img.jpeg": "25f173d0821e49c3ec9f0173bfefd2c6",
"main.dart.js": "70fa621f59a6bafad48f5eca62e5fd60",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"icons/Icon-512.jpeg": "25f173d0821e49c3ec9f0173bfefd2c6",
"icons/Icon-maskable-512.jpeg": "25f173d0821e49c3ec9f0173bfefd2c6",
"icons/Icon-192.jpeg": "25f173d0821e49c3ec9f0173bfefd2c6",
"icons/Icon-maskable-192.jpeg": "25f173d0821e49c3ec9f0173bfefd2c6",
"manifest.json": "abd16686e04c680cc125a7e2e8a10fc3",
"assets/AssetManifest.json": "e70c09946b9eab2131b9936e4f0e5470",
"assets/coding.gif": "4a5d51b6a88e13a23c084ee249246866",
"assets/NOTICES": "e4041aba04fe9429aaec1290299c454b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "05e70ea915ec82e4dacf02e3cfd2f9c2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "5f72d664707e4d711a1c0c240912cd50",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "1c816c94acd7400fc5a478409cee1257",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/images/Icon-512.jpeg": "25f173d0821e49c3ec9f0173bfefd2c6",
"assets/assets/images/manish_profile_img.jpeg": "25f173d0821e49c3ec9f0173bfefd2c6",
"assets/assets/images/Icon-maskable-512.jpeg": "25f173d0821e49c3ec9f0173bfefd2c6",
"assets/assets/images/Icon-192.jpeg": "25f173d0821e49c3ec9f0173bfefd2c6",
"assets/assets/images/Icon-maskable-192.jpeg": "25f173d0821e49c3ec9f0173bfefd2c6",
"assets/assets/images/bg.jpeg": "585f4d826aa95862a3317610253fdc6b",
"assets/assets/icons/github.svg": "5601f8895eab39f6fa7ab29866f3fa8f",
"assets/assets/icons/download.svg": "f4112e64560f5b066e384dc9e763f11e",
"assets/assets/icons/stack_overflow.svg": "9483751649cf03a3b67fe2d553d3f30f",
"assets/assets/icons/tick.svg": "60c2ddfa5bad34413840f025be965dc7",
"assets/assets/icons/email.svg": "165a208e6dd67c3541a8ce2c85cb56f7",
"assets/assets/icons/facebook.svg": "4decfb5b6262ad2ecad426a7626949f8",
"assets/assets/icons/google_play.svg": "28196f5c787c05f9472474af8711d9a8",
"assets/assets/icons/phone.svg": "1f0b141002a18b3aed3ac14da0e30108",
"assets/assets/icons/location.svg": "1f744a51ed6b07dfbe03bfcd1e951ba1",
"assets/assets/icons/linkedin.svg": "2718df0f80edf6d928d2835720192083",
"assets/assets/icons/twitter.svg": "5d49f1db5744d4dadff120634ba237b6",
"assets/assets/icons/apple.svg": "9b3dbd0285e3ce80bd7abd707df35015",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
