<?php

namespace App\Http\Controllers;
use App\User;
use Auth;
use App\Post;
use Illuminate\Http\Request;

class FeedsController extends Controller
{
    public function feed(){ //collection of all post of friends of Auth user
        $friends = Auth::user()->friends();

        $feed = [];
        foreach($friends as $friend){
            foreach($friend->posts as $post){
                array_push($feed,$post);
            }
        }

        foreach(Auth::user()->posts as $post){
            array_push($feed,$post);
        }

        usort($feed,function($p1, $p2){
            return $p1->id < $p2->id;
        });

        return $feed;



    }
}
