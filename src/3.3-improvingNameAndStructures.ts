function multiplyEvenNumbers(numbers: number[]): number[] {
    const evenNumbers = numbers.filter(number => number % 2 === 0)

    const numberToMultiply = 2
    const evenNumbersMultiplied = evenNumbers.map(number => number * numberToMultiply)

    return evenNumbersMultiplied
}

export { }