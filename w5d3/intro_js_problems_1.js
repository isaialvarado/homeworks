// Phase I - JS Fundamentals

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
}

madLib('make', 'best', 'guac');

function isSubstring(searchString, subString) {
  return searchString.indexOf(subString) !== -1;
}

isSubstring("time to program", "time");
isSubstring("Jump for joy", "joys");

// Phase II - JS Looping Constructs

function fizzBuzz(array) {
  let result = [];
  array.forEach((num) => {
    if ((num % 3 === 0) ^ (num % 5 === 0)) {
      result.push(num);
    }
  });
  return result;
}

fizzBuzz([1,2,3,4,5,6,7,8,9]);

function isPrime(number) {
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

isPrime(2);
isPrime(10);
isPrime(15485863);
isPrime(3548563);

function sumOfNPrimes(n) {
  let sum = 0;
  let primes = 0;
  let number = 2;
  while (primes < n) {
    if (isPrime(number)) {
      sum += number;
      primes++;
    }
    number++;
  }
  return sum;
}

sumOfNPrimes(4);

function allOrNothing(mod, ...numbers) {
  return numbers.every(num => (num % mod) === 0);
}

allOrNothing(3, 9, 12, 6);
allOrNothing(5, 1, 2, 10);
