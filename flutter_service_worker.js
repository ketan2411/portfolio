'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "27a8dfc7933104b02f7e4bb959fe4d70",
"/": "27a8dfc7933104b02f7e4bb959fe4d70",
"main.dart.js": "116d3b3136b5b3cac6057218c155cc4b",
"version.json": "7804eb643eb875d188221832d4ff86c5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.json": "9654c89fc143c20e84462e111a19a281",
"assets/json/projects.json": "013fc92206c4ce893ec9d7f511d4e802",
"assets/json/showcase.json": "b686a3fec77ee94b2d54050b510dac23",
"assets/images/infoflight/2.png": "19525f434e874d01c7a59ae6fd07efd0",
"assets/images/infoflight/5.png": "99b5487f9ace401264a9707e08d5803a",
"assets/images/infoflight/4.png": "1dda73e0c298e82854261f5e981d9de4",
"assets/images/infoflight/1.png": "e2555c7e54e4a172aeafa7853ecba99a",
"assets/images/infoflight/3.png": "31e5a75e870cb4e2ebdc154da329b993",
"assets/images/armenu/2.png": "d85004fe10cf44b63156f41a2f50ccbe",
"assets/images/armenu/5.png": "5f228288751fb555cfa9b3dbd9dbf7cc",
"assets/images/armenu/4.png": "049ea658b4e56b78441ce316c202a871",
"assets/images/armenu/1.png": "2a2a29df8c6b21f64f649e6b3aaaefc4",
"assets/images/armenu/3.png": "2da818070a5fcfc3e2bac5ee07a5ddf7",
"assets/images/TRP/2.png": "f4293bdb19894653bf23e80ba322fc24",
"assets/images/TRP/4.png": "d07875f09461f9b8373c627837646c89",
"assets/images/TRP/1.png": "aa4d06ce7ee131eb3e9a8300331957b4",
"assets/images/TRP/3.png": "5ba46aff2b66b3d14d9e67ebaae24618",
"assets/images/qlan/8.jpg": "92ba417db44260580957f7bbbc201979",
"assets/images/qlan/4.jpg": "ee72ad48a11fc1e39a055014286a1b66",
"assets/images/qlan/1.jpg": "2ad3c778e2941bf2cde7c04557b5b460",
"assets/images/qlan/5.jpg": "3cd14eb4d381c15ee4c2e5fa3de0c477",
"assets/images/qlan/2.jpg": "545e62fe7713ca195b3cd9d2b90e0e95",
"assets/images/qlan/7.jpg": "d7073db2d9b4e83ac6b3dc9797c95236",
"assets/images/qlan/3.jpg": "ee72ad48a11fc1e39a055014286a1b66",
"assets/images/qlan/6.jpg": "2282704ae218f416c3db4cd29bc72000",
"assets/packages/flutter_neumorphic/fonts/NeumorphicIcons.ttf": "32be0c4c86773ba5c9f7791e69964585",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "aa1ec80f1b30a51d64c72f669c1326a7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5178af1d278432bec8fc830d50996d6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b37ae0f14cbc958316fac4635383b6e8",
"assets/packages/parallax_example/assets/sun.png": "93d98243ccbb0e2f926d0d320e31f921",
"assets/packages/parallax_example/assets/2.png": "b46e6f01aa9937b71e9fc66681c335e3",
"assets/packages/parallax_example/assets/4.png": "1a1340c20a52df528e66c19661eb8d13",
"assets/packages/parallax_example/assets/glow.png": "c914142098db86d98d1d0701e212bf54",
"assets/packages/parallax_example/assets/1.png": "09cd7efd4211a4a94688877dcc628fc9",
"assets/packages/parallax_example/assets/attribute.png": "3cc084e13779671cb34cdad8024a6237",
"assets/packages/parallax_example/assets/3.png": "a2367cea617f97ec3b9c03f71ebd5092",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/assets/sun.png": "93d98243ccbb0e2f926d0d320e31f921",
"assets/assets/melon.png": "d57b3f6f099613e052fddc0ed4e718ff",
"assets/assets/2.png": "b46e6f01aa9937b71e9fc66681c335e3",
"assets/assets/json/projects.json": "e630865201e6e44354f700caa11b88e4",
"assets/assets/json/showcase.json": "b686a3fec77ee94b2d54050b510dac23",
"assets/assets/images/infoflight/2.png": "19525f434e874d01c7a59ae6fd07efd0",
"assets/assets/images/infoflight/thumbnail/3_small.png": "d25ed500482cee03d38a47510ffe8c08",
"assets/assets/images/infoflight/thumbnail/2_small.png": "980e9fdba907186cb39764cea9d4fd56",
"assets/assets/images/infoflight/thumbnail/5_small.png": "117de35da1afab30831082c9777ac347",
"assets/assets/images/infoflight/thumbnail/4_small.png": "f458c94f7f25244bb9e746794776093a",
"assets/assets/images/infoflight/thumbnail/1_small.png": "6274a1a66b4a007aeb23c9a5d979cf3d",
"assets/assets/images/infoflight/5.png": "99b5487f9ace401264a9707e08d5803a",
"assets/assets/images/infoflight/4.png": "1dda73e0c298e82854261f5e981d9de4",
"assets/assets/images/infoflight/1.png": "e2555c7e54e4a172aeafa7853ecba99a",
"assets/assets/images/infoflight/3.png": "31e5a75e870cb4e2ebdc154da329b993",
"assets/assets/images/armenu/2.png": "d85004fe10cf44b63156f41a2f50ccbe",
"assets/assets/images/armenu/thumbnail/3_small.png": "563ac495dfad683817124fb8a27601a8",
"assets/assets/images/armenu/thumbnail/2_small.png": "72f9ec89316fa3ed918790c3fd62c6a5",
"assets/assets/images/armenu/thumbnail/5_small.png": "a690f822ac32a9d9cee694fc4109a307",
"assets/assets/images/armenu/thumbnail/4_small.png": "99f8867a0645ba5a8ea9614b2e47b145",
"assets/assets/images/armenu/thumbnail/1_small.png": "74e0a43e770403d2a0bc287b74f54a74",
"assets/assets/images/armenu/5.png": "5f228288751fb555cfa9b3dbd9dbf7cc",
"assets/assets/images/armenu/4.png": "049ea658b4e56b78441ce316c202a871",
"assets/assets/images/armenu/1.png": "2a2a29df8c6b21f64f649e6b3aaaefc4",
"assets/assets/images/armenu/3.png": "2da818070a5fcfc3e2bac5ee07a5ddf7",
"assets/assets/images/TRP/2.png": "f4293bdb19894653bf23e80ba322fc24",
"assets/assets/images/TRP/thumbnail/3_small.png": "2d1ae82e287e4981979a67d1edc0c8e7",
"assets/assets/images/TRP/thumbnail/2_small.png": "03de8703af0689eb4eeeff48e89cc4ba",
"assets/assets/images/TRP/thumbnail/4_small.png": "e24674b32f18e012d34c9a4f7e713612",
"assets/assets/images/TRP/thumbnail/1_small.png": "52d2144b2dfd8059bf7aacfaf1d7d1f9",
"assets/assets/images/TRP/4.png": "d07875f09461f9b8373c627837646c89",
"assets/assets/images/TRP/1.png": "aa4d06ce7ee131eb3e9a8300331957b4",
"assets/assets/images/TRP/3.png": "5ba46aff2b66b3d14d9e67ebaae24618",
"assets/assets/images/qlan/8.jpg": "92ba417db44260580957f7bbbc201979",
"assets/assets/images/qlan/4.jpg": "ee72ad48a11fc1e39a055014286a1b66",
"assets/assets/images/qlan/1.jpg": "2ad3c778e2941bf2cde7c04557b5b460",
"assets/assets/images/qlan/thumbnail/5_small.jpg": "3ac2e799719c53ab5925c1fe9541de4a",
"assets/assets/images/qlan/thumbnail/7_small.jpg": "d3ab595af40150eca40fa647ea6659b7",
"assets/assets/images/qlan/thumbnail/4_small.jpg": "1aaca38e638cc3f29af85ed28b84ce35",
"assets/assets/images/qlan/thumbnail/6_small.jpg": "8ea03fd4d1ae0616060e6aa5919f9783",
"assets/assets/images/qlan/thumbnail/8_small.jpg": "f14bd0575c3b61edc1cea60b02fc6f64",
"assets/assets/images/qlan/5.jpg": "3cd14eb4d381c15ee4c2e5fa3de0c477",
"assets/assets/images/qlan/2.jpg": "545e62fe7713ca195b3cd9d2b90e0e95",
"assets/assets/images/qlan/7.jpg": "d7073db2d9b4e83ac6b3dc9797c95236",
"assets/assets/images/qlan/3.jpg": "ee72ad48a11fc1e39a055014286a1b66",
"assets/assets/images/qlan/6.jpg": "2282704ae218f416c3db4cd29bc72000",
"assets/assets/4.png": "1a1340c20a52df528e66c19661eb8d13",
"assets/assets/parallax_logo.png": "ce9c58739e0482810a48a6b73c25d993",
"assets/assets/cherry.png": "2990f551a9b60842768b3ab8a77e1818",
"assets/assets/glow.png": "c914142098db86d98d1d0701e212bf54",
"assets/assets/banana.png": "59d14e1e02719b6e3bd88ad3ffc4fc2c",
"assets/assets/bell.png": "8a4f078b49d95052a883e10f5b26dd6d",
"assets/assets/1.png": "09cd7efd4211a4a94688877dcc628fc9",
"assets/assets/attribute.png": "3cc084e13779671cb34cdad8024a6237",
"assets/assets/3.png": "a2367cea617f97ec3b9c03f71ebd5092",
"assets/NOTICES": "a49d2dd587c68e1536d4c5160fd4cf91",
"manifest.json": "a46452c5139d40cdd344eefb62887fee"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
