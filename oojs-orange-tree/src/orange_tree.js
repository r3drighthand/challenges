var OrangeTree = function(age, height, oranges) {
  this.age = age;
  this.height = height;
  this.oranges = oranges;
}

OrangeTree.prototype.isMature = function(){
  if (this.age >= 6){
    return true;
  } else {
    return false;
  }
}

OrangeTree.prototype.isDead = function(){
  if (this.age === 100) {
    return true;
  } else {
    return false;
  }

}

OrangeTree.prototype.hasOranges = function(){
  if (this.oranges.length > 0){
    return true;
  } else {
    return false;
  }
}

OrangeTree.prototype.maximumHeight = 25;

OrangeTree.prototype.passGrowingSeason = function(){
  this.oranges = [];
  if (!this.isDead()){
    this.age ++;
    this.height += 2.5;
    if (this.height > 25){
      this.height = 25;
    }
    if (this.isMature()){
      for (i = 0; i < 10; i++){
        this.oranges.push(new Orange());
      }
    }
  }
}

OrangeTree.prototype.pickAnOrange = function(){
    // console.log("hello");
    // console.log(this.oranges.pop());
    return this.oranges.pop();
}
