<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FirstApiInLaravel extends Controller
{

    public function fetchData()
    {
        // $users = Users::all();
        return response()->json(['users' => "sanjit"], 200);
    }
}
