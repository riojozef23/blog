<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Arr;

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
        "posts" =>
        [
            [
                "id" => 1,
                "slug" =>"article-1",
                "title" => "Article 1",
                "author" => "Rio Jozef",
                "date" => "23 Juni 2025",
                "body" => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            ],
            [
                "id" => 2,
                "slug" =>"article-2",
                "title" => "Article 2",
                "author" => "Rio Jozef",
                "date" => "24 Juni 2025",
                "body" => "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos."
            ]
        ]
    ];
    return view('posts', $data);
});



Route::get('/contact', function () {
    return view(
        "contact",
        ["title" => "Contact Page"],
    );
});

Route::get('/posts/{slug}', function ($slug) {
    $posts = [
        [
            "id" => 1,
            "slug" =>"article-1",
            "title" => "Article 1",
            "author" => "Rio Jozef",
            "date" => "23 Juni 2025",
            "body" => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        ],
        [
            "id" => 2,
            "slug" =>"article-2",
            "title" => "Article 2",
            "author" => "Rio Jozef",
            "date" => "24 Juni 2025",
            "body" => "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos."
        ]
    ];
    $post = Arr::first($posts, function ($post) use ($slug) {
        return $post['slug'] == $slug;
    });
    return view(
        'post',
        [
            "title" => "Single Post",
            "post" => $post,
        ]
    );
});
