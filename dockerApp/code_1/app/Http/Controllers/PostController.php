<?php

namespace App\Http\Controllers;
use App\Post;
use App\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
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


    public function index(){
      $response = Post::all();
      return response()->json(['response'=> $response]);
    }


    public function store(Request $request){

        $post = Post::create($request->all());
        $user = Auth::user();
        $post->user_id = $user->id;
        $post->save();
        return response()->json(['response'=>$post], 200);

      // $post = Post::Create($request->all());
    }

    public function show($id){
      return response()->json(['response' => Post::find($id)]);
    }

    //
}
