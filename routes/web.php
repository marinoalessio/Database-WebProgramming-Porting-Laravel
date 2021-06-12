<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('home');
});

Route::get('login', 'LoginController@login');
Route::post('login', 'LoginController@checkLogin');
Route::get('logout', 'LoginController@logout');

Route::get('signup', 'SignupController@signup');
Route::get('signup/checkUsername/{q}', 'SignupController@checkUsername');
Route::get('signup/checkEmail/{q}', 'SignupController@checkEmail');
Route::post('signup', "SignupController@register")->name('signup');

Route::get('home', 'HomeController@home');

Route::get('explore', 'ExploreController@explore');
Route::get('explore/profile_info', 'ExploreController@profileInfo');
Route::get('explore/loadUserReview', 'ExploreController@loadUserReview');
Route::get('explore/loadOthersReview', 'ExploreController@loadOthersReview');
Route::get('explore/like/{review_id}', 'ExploreController@like');
Route::get('explore/unlike/{review_id}', 'ExploreController@unlike');
Route::get('explore/fetchArtworks/{q}', 'ExploreController@fetchArtworks');
Route::post('explore/postReview', 'ExploreController@postReview')->name('postReview');
Route::get('explore/loadFollowings', 'ExploreController@loadFollowings');
Route::get('explore/followDirector/{id}', 'ExploreController@followDirector');
Route::get('explore/unfollowDirector/{id}', 'ExploreController@unfollowDirector');

Route::get('events', 'EventsController@events');
Route::get('events/loadEvents/{isChecked}/{limit}', 'EventsController@loadEvents');
Route::get('events/details/{id}', 'EventsController@eventDetails');
Route::get('events/loadHighlights', 'EventsController@loadHighlights');
Route::get('events/addToHighlights/{id}', 'EventsController@addToHighlights');
Route::get('events/removeFromHighlights/{id}', 'EventsController@removeFromHighlights');
Route::get('events/loadAdvCategory', 'EventsController@loadAdvCategory');
Route::get('events/loadAdv/{query}', 'EventsController@loadAdv');

Route::get('admin', 'AdminController@admin');
Route::post('admin/guide', 'AdminController@uploadGuide')->name('guide');
Route::post('admin/director', 'AdminController@uploadDirector')->name('director');
Route::post('admin/event', 'AdminController@uploadEvent')->name('event');

?>