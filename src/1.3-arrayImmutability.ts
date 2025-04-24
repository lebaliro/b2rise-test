// 1.3 Imutabilidade e Manipulação de Arrays
// Implemente uma função que recebe uma lista de números e retorna uma nova lista onde todos os números negativos são transformados em positivos, 
// sem modificar a lista original.

// Exemplo:

// const numbers = [-1, 2, -3, 4];
// const result = makeAllPositive(numbers);
// Saída esperada: [1, 2, 3, 4]

function makeAllPositive(numbers: number[]): number[] {
    return numbers.map(number => Math.abs(number));
}

const numbers = [-1, 2, -3, 4];
const result = makeAllPositive(numbers);

console.log(result);

export { }