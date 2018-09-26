var SalesTeam = function(employees){
  this.employees = employees;
}

SalesTeam.prototype.find = function(name){
  for(var i = 0; i < this.employees.length; i++){
    if (this.employees[i].firstName === name){
      return this.employees[i];
    }
  }
}

SalesTeam.prototype.bonusEarners = function(){
  var bonusGetters = [];
  for(var i = 0; i < this.employees.length; i++){
    if (this.employees[i].totalSales() >= 2500){
      bonusGetters.push(this.employees[i]);
    }
  }
  return bonusGetters;
}
