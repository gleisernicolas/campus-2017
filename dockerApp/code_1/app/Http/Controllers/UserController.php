<?php

namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }


    // public function index(){
    //   $response = Post::all();
    //   return response()->json(['response'=> $response]);
    // }

    public function index(){
        $response = User::all();
        return response()->json(['response' => $response]);
    }

    public function store(Request $request){
      $user = User::Create($request->all());
      return response()->json(['response'=> $user]);
    }

    // public function show($id){
    //   return response()->json(['response' => Post::find($id)]);
    // }

    //
}
