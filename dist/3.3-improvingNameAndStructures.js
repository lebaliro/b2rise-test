"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function multiplyEvenNumbers(numbers) {
    const evenNumbers = numbers.filter(number => number % 2 === 0);
    const numberToMultiply = 2;
    const evenNumbersMultiplied = evenNumbers.map(number => number * numberToMultiply);
    return evenNumbersMultiplied;
}
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
console.log(multiplyEvenNumbers(numbers));
