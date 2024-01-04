<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

$routes->group('penyuluhan', function($routes) {
    $routes->get('/', 'Home::index');
    $routes->match(['get', 'post'], 'create', 'Home::createPenyuluhan');
    $routes->match(['get', 'post'], 'update/(:num)', 'Home::updatePenyuluhan/$1');
    $routes->get('delete/(:num)', 'Home::deletePenyuluhan/$1');
});

$routes->group('jurnal', function($routes) {
    $routes->get('/', 'Jurnal::index');
    $routes->match(['get', 'post'], 'create', 'Jurnal::create');
    $routes->match(['get', 'post'], 'update/(:num)', 'Jurnal::update/$1');
    $routes->get('delete/(:num)', 'Jurnal::delete/$1');
});


