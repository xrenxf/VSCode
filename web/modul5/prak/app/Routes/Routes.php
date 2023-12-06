<?php

namespace app\Routes;

include "app/Controller/Controller.php";

use app\Controller\Controller;

class Routes
{
    public function handle($method, $path)
    {
        if ($method == 'GET' && $path == '/api/product') {
            $controller = new Controller();
            echo $controller->getAllProduct();
        } elseif ($method == 'GET' && strpos($path, '/api/product') == 0) {
            $pathParts = explode('/', $path);
            $id = $pathParts[count($pathParts) - 1];

            $controller = new Controller();
            echo $controller->getProductById($id);
        } elseif ($method == 'POST' && $path == '/api/product') {
            $controller = new Controller();
            echo $controller->addProduct();
        } elseif ($method == 'PUT' && strpos($path, '/api/product') == 0) {
            $pathParts = explode('/', $path);
            $id = $pathParts[count($pathParts) - 1];

            $controller = new Controller();
            echo $controller->editProductById($id);
        } elseif ($method == 'DELETE' && strpos($path, '/api/product') == 0) {
            $pathParts = explode('/', $path);
            $id = $pathParts[count($pathParts) - 1];

            $controller = new Controller();
            echo $controller->removeProductById($id);
        }

        if ($method == 'GET' && $path == '/api/category') {
            $controller = new Controller();
            echo $controller->getAllCategory();
        } elseif ($method == 'GET' && strpos($path, '/api/category') == 0) {
            $pathParts = explode('/', $path);
            $id = $pathParts[count($pathParts) - 1];

            $controller = new Controller();
            echo $controller->getCategoryById($id);
        } elseif ($method == 'POST' && $path == '/api/category') {
            $controller = new Controller();
            echo $controller->addCategory();
        } elseif ($method == 'PUT' && strpos($path, '/api/category') == 0) {
            $pathParts = explode('/', $path);
            $id = $pathParts[count($pathParts) - 1];

            $controller = new Controller();
            echo $controller->editCategoryById($id);
        } elseif ($method == 'DELETE' && strpos($path, '/api/category') == 0) {
            $pathParts = explode('/', $path);
            $id = $pathParts[count($pathParts) - 1];

            $controller = new Controller();
            echo $controller->removeCategoryById($id);
        }
    }
}
