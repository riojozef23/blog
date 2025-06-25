<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Arr;
use App\Models\Post;

Route::get('/', function () {
    return view(
        "home",
        ["title" => "Home Page"],
    );
});

Route::get('/about', function () {
    $data = [
        "title" => "About Page",
        "first" => "Rio",
        "last" => "Jozef",
    ];
    return view('about', $data);
});

Route::get('/posts', function () {
    $data = [
        "title" => "Blog Page",
        "posts" => Post::all(),
    ];
    return view('posts', $data);
});



Route::get('/contact', function () {
    return view(
        "contact",
        ["title" => "Contact Page"],
    );
});

// Route::get('/posts/{slug}', function ($slug) {

//     $post = Post::where('slug', $slug)->first();

//     return view(
//         'post',
//         [
//             "title" => "Single Post",
//             "post" => $post,
//         ]
//     );
// });

Route::get('/posts/{post:slug}', function (Post $post) {
    return view(
        'post',
        [
            "title" => "Single Post",
            "post" => $post,
        ]
    );
});

