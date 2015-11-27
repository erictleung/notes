// Javascript Notes

// print text
console.log("Hello, world!");

// strings
var name = "Joe";
name.length; // get length of string
name[0]; // get "first" element of string
name[name.length - 1]; // get last element of string

var longString = "Here is a sentence.";
longString.split(" "); // split by spaces
var joinMe = ["Na ", "Na ", "Na ", "Na ", "Batman!"];
joinMe.join(" "); // join together with spaces

// numbers
var number = 4; // set number
var other = (4 * 2) + 4; // combining operations
Math.random(); // creates floating point num 0 (incl) to 1 (excl)

// arrays
var numArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; // number array
var sampleArray = ["Joe", 42]; // holds different data
var nested = [["Bob", 32]]; // make nested array
sampleArray[0]; // access first element, zero-indexed
sampleArray.pop(); // remove and return last element
sampleArray.push(42); // "push" data to last element
sampleArray.shift(); // remove first element
sampleArray.unshift("Joe"); // add data to first element

// map method on array - apply method over all elements
var timesFour = numArray.map(function(val) {
  return val * 4;
})

// reduce method on array - condense elements to one value
var addAll = numArray.reduce(function(pre, curr) {
  return pre + curr;
}, 0);

// filter method on array - filter elements of array based on condition
var lessSix = numArray.filter(function(val) {
  return val < 5;
});

// functions
function ourFunction(a, b) {
    // do stuff here
    return a - b;
};

// javascript object
var car = {
  "wheels":4,
  "engines":1,
  "seats":5
};
