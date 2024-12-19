<?php

namespace app\Controller;

include "app/Traits/ApiResponseFormatter.php";
include "app/Models/Model.php";

use app\Traits\ApiResponseFormatter;
use app\Models\Model;

class Controller
{
    use ApiResponseFormatter;

    public function getAllProduct()
    {
        $productModel = new Model();
        $response = $productModel->selectAllProduct();
        return $this->apiResponse(200, "Success", $response);
    }

    public function getProductById($id)
    {
        $productModel = new Model();
        $response = $productModel->selectProductById($id);
        return $this->apiResponse(200, "Success", $response);
    }

    public function addProduct()
    {
        $jsonInput = file_get_contents('php://input');
        $inputData = json_decode($jsonInput, true);
        if (json_last_error()) {
            return $this->apiResponse(400, "Error Invalid Input", null);
        }
        $productModel = new Model();
        $response = $productModel->insertProduct([
            "product_name" => $inputData['product_name'],
            "category_id" => $inputData['category_id']
        ]);

        return $this->apiResponse(200, "Success", $response);
    }

    public function editProductById($id)
    {
        $jsonInput = file_get_contents('php://input');
        $inputData = json_decode($jsonInput, true);
        if (json_last_error()) {
            return $this->apiResponse(400, "Error Invalid Input", null);
        }
        $productModel = new Model();
        $response = $productModel->setProductById([
            "product_name" => $inputData['product_name']
        ], $id);

        return $this->apiResponse(200, "Success", $response);
    }

    public function removeProductById($id)
    {
        $productModel = new Model();
        $response = $productModel->deleteProductById($id);

        return $this->apiResponse(200, "Success", $response);
    }

    public function getAllCategory()
    {
        $categoryModel = new Model();
        $response = $categoryModel->selectAllCategory();
        return $this->apiResponse(200, "Success", $response);
    }

    public function getCategoryById($id)
    {
        $categoryModel = new Model();
        $response = $categoryModel->selectCategoryById($id);
        return $this->apiResponse(200, "Success", $response);
    }

    public function addCategory()
    {
        $jsonInput = file_get_contents('php://input');
        $inputData = json_decode($jsonInput, true);
        if (json_last_error()) {
            return $this->apiResponse(400, "Error Invalid Input", null);
        }
        $categoryModel = new Model();
        $response = $categoryModel->insertCategory([
            "category_name" => $inputData['category_name']
        ]);

        return $this->apiResponse(200, "Success", $response);
    }

    public function editCategoryById($id)
    {
        $jsonInput = file_get_contents('php://input');
        $inputData = json_decode($jsonInput, true);
        if (json_last_error()) {
            return $this->apiResponse(400, "Error Invalid Input", null);
        }
        $categoryModel = new Model();
        $response = $categoryModel->setCategoryById([
            "category_name" => $inputData['category_name']
        ], $id);

        return $this->apiResponse(200, "Success", $response);
    }

    public function removeCategoryById($id)
    {
        $categoryModel = new Model();
        $response = $categoryModel->deletCategoryById($id);

        return $this->apiResponse(200, "Success", $response);
    }
}
