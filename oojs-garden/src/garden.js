var garden = {
  name: "Kula Botanical Garden",
  location: "Makawao",
  flowers: [],
  addFlower: function(flower) {
    return this.flowers.push(flower);
  },
  plant: function(plants) {
    for(i = 0; i < plants.length; i++){
      this.flowers.push(plants[i]);
    }
    return this.flowers;
  },
  remove: function(flower) {
    var index = this.flowers.indexOf(flower);
     this.flowers.splice(index, 1);
     return this.flowers;
  },
  flowersByColor: function(color) {
    return this.flowers.filter(function(flower){
      return flower.color === color;
    });
  },
  flowersByName: function(name) {
    return this.flowers.filter(function(flower){
      return flower.name === name;
    });
  }
}