var Employee = function(info){
  this.firstName = info.firstName;
  this.sales = info.sales;
}

Employee.prototype.totalSales = function(){
  var total = 0;
  for(var i = 0; i < this.sales.length; i++){
    total += this.sales[i];
  }
  return total;
}

Employee.prototype.averageSales = function(){
  var total = this.totalSales();
  return total/this.sales.length
}
