// Scala Notes

val num1 = 10 // declaring value i.e. does not change and immuntable
var num2 = 20 // declaring variable

1.to(10) // yields Range(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

num2 += 5 // increment by 5
num2 -= 5 // decrement by 5

// function definitions
def max(x: Int, y: Int): Int = {
  if (x > y) x
  else y
}

// anonymous functions
val addOne = (x: Int) => x + 1
addOne(1) // Int = 2

// nested functions
def time2(x: Int) = {

  def times(a: Int, b: Int) = a * b

  times(2, x) // automatically returns result
}

// read from file
import io.Source
val source = Source.fromFile("FILENAME")
val lines = source.getLines // creates iterator
val allArray = source.getLines.toArray // create array of input
val lineStr = source.getLines.mkString // make input into one string

// write to file using Java libraries
import java.io.PrintWriter
val out = new PrintWriter("OUTPUT.txt")
out.println(lineStr)
out.close()

// compressed `for` loop
for (i <- 1 to 3; j <- 1 to 3) print((10 * i + j) + " ")

// `for` loop comprehension to return collection of values
for (i <- 1 to 10) yield i % 3

// write partial function for use later
def adder(m: Int, n: Int) = m + n // add two numbers together
val add2 = adder(2, _:Int) // add two to a number
add2(5) // Int = 7

// curried functions to apply some functions now, and then rest later
def multiply(m: Int)(n: Int): = m * n
multiply(2)(3) // Int = 6
val timesTwo = multiply(2) _ // value to multiply by two

val curriedAdd = (adder _).curried // curry existing function w/ multiple params
val addTwo = curriedAdd(2) // will add two to number

// allow use of variable arguments
def capitalAll(args: String*) = {
  args.map { arg =>
    arg.capitalize
  }
}
// or more succintly
def anotherCapital(args: String*) = { args.map(_.capitalize }

// example class definition
class Calculator {
  val brand: String = "HP"
  def add(m: Int, n: Int): Int = m + n
}
val calc = new Calculator // instantiate new object
calc.add(1, 2) // use method from class
calc.brand // String = "HP"

// create constructors
class Calculator(brand: String) {
  val color: String = if (brand == "TI") {
    "blue"
  } else if (brand == "HP") {
    "black"
  } else {
    "white"
  }
  def add(m: Int, n: Int): Int = m + n
}
val calc = new Calculator("TI")
calc.color // String = blue

// extending a class with inheritance
class ScientificCalculator(brand: String) extends Calculator(brand) {
  def log(m: Double, base: Double) = math.log(m) / math.log(base)
}
