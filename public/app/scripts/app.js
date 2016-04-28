'use strict';

/**
 * @ngdoc overview
 * @name bandaokeApp
 * @description
 * # bandaokeApp
 *
 * Main module of the application.
 */
angular
  .module('bandaokeApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '/app/views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
      })
      .when('/about', {
        templateUrl: '/app/views/about.html',
        controller: 'AboutCtrl',
        controllerAs: 'about'
      })
      .when('/songs/new',{
        templateUrl: '/app/views/songs/new.html',
        controller: 'SongCtrl',
        controllerAs: 'new'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
