var Sets = require('./sets.js');

test("Singleton does not contain element", function () {
  var s1 = Sets.singletonSet(1);
  return !s1(4)
});

test("Singleton contains element", function () {
  var s1 = Sets.singletonSet(1);
  return s1(1)
});

// Union

//Intersect

//Diff

//Filter

//Forall

//Exists

//Map

console.log("All tests passed")


/* test(String name, Function fnc)
 *  - name: the name of the test
 *  - fnc: a function that returns true if the test passes, otherwise false
 * `test` will throw an exception if fnc() returns false
 */
function test(name, fnc) {
  console.log("====================================================")
  console.log('Test: "%s"', name);
  console.log("====================================================")
  try {
    console.assert(fnc(), name);
  } catch (e) {
    console.log("Test Failed\n");
    throw e;
  }
  console.log("Test Passed\n");
}
