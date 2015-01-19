// var app = angular.module('app_name', array_of_module_name);
// arr_of module_name = ['ngRoute','ng-polymer-elements']

// Successfully initialize Angular with no extra modules.  So, we left the array to be blank
var app = angular.module("kitty",[]);

// Define a controller inside Angular.  Please don't get htis controller confuseed with Rails Controllers.  THey are different

// This is a template for initializing an Angular controller
// app.controller('name_of_controller', function('refer to the modules if you have any')){
// })

// Naming convertion for controller -> "NameCtrl"
app.controller('PostCtrl',function($scope){
  //this $ is not Jquery
  $scope.brand = "Coca-Cola";

  $scope.prices = [1,2,3,4,5];

  var pricesTotal = function(prices){
    var total = 0;
    for(var i = 0; i < prices.length; i++) {
      var price = prices[i];
      total += price;
    }
    return total;
  };
  
  $scope.total = pricesTotal($scope.prices);

  // var getTotal = function(prices) {
  //   var total = 0;
  //   for(var i = 0; i < prices.length; i++) {
  //     var price = prices[i];
  //     total += price;
  //   }
  //   return total;
  // }
  
  console.log($scope);

  $scope.addPrice = function(){
    if (isNaN($scope.newPrice) == false && $scope.newPrice != "") {
      $scope.prices.push(Number($scope.newPrice));
      $scope.newPrice = "";
      $scope.total = pricesTotal($scope.prices);
    }
    else {
      alert("Please input a number")
      $scope.newPrice = "";
    }
  };

});



app.controller("CompanyCtrl",function($scope){

  $scope.companies = ["Apple","Google","Amazon","Call of Duty"];


});















