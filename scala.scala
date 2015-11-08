// Scala Notes

val num1 = 10 // declaring value
var num2 = 20 // declaring variable

1.to(10) // yields Range(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

num2 += 5 // increment by 5
num2 -= 5 // decrement by 5

// function definitions
def max(x: Int, y: Int): Int = {
  if (x > y) x
  else y
}

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
