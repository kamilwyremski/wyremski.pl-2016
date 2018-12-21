const CACHE_NAME = 'wyremski.pl-cache-108';

// List of files which are store in cache.
let filesToCache = [
    '/',
	'/projekty/',
	'/skrypty/',
	'/kontakt/',
	'/skrypt/notice2/',
	'/skrypt/demoty2/',
	'/skrypt/cuadro/',
	'/skrypt/empresa/',
	'/skrypt/holmes/',
	'/skrypt/festa/',
	'/en/',
	'/en/projects/',
	'/en/scripts/',
	'/en/contact/',
	'/en/script/notice2/',
	'/en/script/demoty2/',
	'/en/script/cuadro/',
	'/en/script/empresa/',
	'/en/script/holmes/',
	'/en/script/festa/',
	'/upload/images/skills.png',
	'/upload/images/technologies.png',
	'/upload/images/header.jpg',
	'/upload/images/kamil_wyremski.jpg',
	'/upload/images/contact.jpg',
	'/upload/images/languages.png',
	'/upload/images/background_desk.jpg',
	'/upload/images/logo_144x144.png',
	'/upload/images/logo_192x192.png',
	'/upload/images/logo_256x256.png',
	'/upload/images/logo_512x512.png',
	'/views/fonts/montserrat.woff2',
	'/views/fonts/montserrat-latin.woff2',
	'/views/fonts/fontawesome-webfont.woff2?v=4.6.1'
];

self.addEventListener('install', (event) => {
  event.waitUntil(caches.open(CACHE_NAME).then((cache) => {
    return cache.addAll(filesToCache);
  }));
});
 
self.addEventListener('fetch', (event) => {
  event.respondWith(caches.match(event.request).then((response) => {
    return response ? response : fetch(event.request);
  }));
});