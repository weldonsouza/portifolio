'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "061068e2c9bf138d06622981ae841092",
"index.html": "022ad6f8b4d7d79722305de3d5911e8b",
"/": "022ad6f8b4d7d79722305de3d5911e8b",
"main.dart.js": "a1537b42f18b205dfded3acf66ad853b",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "4a34600a625896e79a2c244824dbbfca",
"assets/AssetManifest.json": "df26b0485be5324fdb127a31862c9d65",
"assets/NOTICES": "5d2f1cb87606cdeed797b6418fde1ab8",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/enigma.png": "2a1c93f57b44aa7126890cd1dcfde0af",
"assets/assets/images/job_search_app.png": "45791ddc50d859dd0c0e4e4b9c90f0ff",
"assets/assets/images/freelancer.svg": "4672ddb3de65c7a6e787504fa2c9c8f5",
"assets/assets/images/cielo_ecommerce.png": "74af732eb47419391900357dad2e6149",
"assets/assets/images/rotamedi.png": "81730645aa9906f03bf92fe432d4fed5",
"assets/assets/images/version_control1.svg": "c8b0ca0ff9340a6af87e5db327be0554",
"assets/assets/images/pricing.png": "81a0bf7659c07086e5ebe5b4a243529d",
"assets/assets/images/orcamento.png": "2631c0a6953e294e86fee5b92d911092",
"assets/assets/images/carajas.png": "07a03b00fa68df86e9ec84cde16b9f58",
"assets/assets/images/creditcarddetector.png": "1e5bdd67b94c91d33b8baf11b6ffe89c",
"assets/assets/images/tmath.png": "c11cf0338d4f7d0ef4b2759de283c347",
"assets/assets/images/background.jpg": "d89431275aebf9fc897c233c9dd73ccb",
"assets/assets/images/code_thinking.svg": "37ce1e481d241e7f8d5d685310ddb9ff",
"assets/assets/images/consulta_estoque.png": "361edc14f7dc939729e912193dc9118a",
"assets/assets/images/coding.svg": "406bac5c5d07073038452b257103854f",
"assets/assets/images/flutter_credit_card_detector.png": "1e5bdd67b94c91d33b8baf11b6ffe89c",
"assets/assets/images/shoes.png": "f3ab6d81512865d7f2cc337d3534d165",
"assets/assets/images/partiu.jpeg": "13c89b51e67fa7d0004b54661503ed0f",
"assets/assets/images/code_thinking1.svg": "7be58c1b8e0c43db585947cad15a9b4b",
"assets/assets/images/version_control.svg": "d34bf92bcb11ddc014e2f1bcd477a97c",
"assets/assets/images/libcom.png": "d7da62609309ccd94d7a173eac2cad98",
"assets/assets/icons/github.svg": "b7c0164bf46fcd949cb6999d40123104",
"assets/assets/icons/package.svg": "f78c0fee566758824cb53d46838ea8c7",
"assets/assets/icons/google_play1.svg": "13d01735aa5dad2cc5ef8a923c6c6707",
"assets/assets/icons/download.svg": "628700a3031424d215a441fab2da1731",
"assets/assets/icons/external_link.svg": "f7ae484005e9e9435d5f8efea630f330",
"assets/assets/icons/check.svg": "4220c82511cc1dfb40b8bba7d25c5f55",
"assets/assets/icons/google1.svg": "d518b276080dca62689985f2cdaecb8c",
"assets/assets/icons/google_play.svg": "64884d22b8b25bcbeb54fd90edff7acd",
"assets/assets/icons/google.svg": "6361f7fd1b053a73376126d50f4cc034",
"assets/assets/icons/linkedin.svg": "b366644d04a64ef14c2911cc9c6f14eb",
"assets/assets/icons/twitter.svg": "a4a0163fef48a4247a305528c07bc4fa",
"assets/assets/icons/github_outline.svg": "5d54b284958c542478d1d84f76063022",
"assets/assets/icons/apple.svg": "6656ce42392544d786c4551af1e0a548",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
