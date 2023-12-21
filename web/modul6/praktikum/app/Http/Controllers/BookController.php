<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreBookRequest;
use App\Http\Requests\UpdateBookRequest;
use App\Http\Resources\BookCollection;
use App\Http\Resources\BookResource;
use App\Models\Book;
use Exception;
use Illuminate\Http\Request;

class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $queryData = Book::all();
            $formattedDatas = new BookCollection($queryData);

            return response()->json([
                'message' => 'success',
                'data' => $formattedDatas
            ], 200);
        } catch (Exception $error) {
            return response()->json($error->getMessage(), 400);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreBookRequest $request)
    {
        $validatedRequest = $request->validated();
        try {
            $queryData = Book::create($validatedRequest);
            $formattedDatas = new BookResource($queryData);

            return response()->json([
                'message' => 'success',
                'data' => $formattedDatas
            ], 200);
        } catch (Exception $error) {
            return response()->json($error->getMessage(), 400);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try {
            $queryData = Book::findOrFail($id);
            $formattedDatas = new BookResource($queryData);

            return response()->json([
                'message' => 'success',
                'data' => $formattedDatas
            ], 200);
        } catch (Exception $error) {
            return response()->json($error->getMessage(), 400);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBookRequest $request, string $id)
    {
        $validatedRequest = $request->validated();
        try {
            $queryData = Book::findOrFail($id);
            $queryData->update($validatedRequest);
            $queryData->save();
            $formattedDatas = new BookResource($queryData);

            return response()->json([
                'message' => 'success',
                'data' => $formattedDatas
            ], 200);
        } catch (Exception $error) {
            return response()->json($error->getMessage(), 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $queryData = Book::findOrFail($id);
            $queryData->delete();
            $formattedDatas = new BookResource($queryData);

            return response()->json([
                'message' => 'success',
                'data' => $formattedDatas
            ], 200);
        } catch (Exception $error) {
            return response()->json($error->getMessage(), 400);
        }
    }
}