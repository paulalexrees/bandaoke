'use strict';

/**
 * @ngdoc overview
 * @name bandaokeApp
 * @description
 * # bandaokeApp
 *
 * Main module of the application.
 */
var bandaokeApp = angular
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
      .when('/songs/new',{
        templateUrl: '/app/views/songs/new.html',
        controller: 'SongCtrl',
        controllerAs: 'SongCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
