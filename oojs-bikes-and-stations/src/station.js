var Station = function(name, location, bikes) {
  this.name = name;
  this.location = location;
  this.bikes = bikes;
}

Station.prototype.empty = function() {
    if (this.bikes.length > 0) {
      return false;
    } else {
      return true;
    }
}

Station.prototype.newestBike = function() {
  this.bikes.sort(function(a, b) {
    return b.modelYear - a.modelYear;
  })
  return this.bikes[0];
}

Station.prototype.take = function(bike) {
  this.bikes.push(bike);
}

Station.prototype.takeMultiple = function(bikes) {
  this.bikes = this.bikes.concat(bikes);
}

Station.prototype.release = function() {
  var newestBike = this.newestBike();
  indexOfNewest = this.bikes.indexOf(newestBike)
  return this.bikes.splice(indexOfNewest, 1)[0];
}
