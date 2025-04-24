"use strict";
// 1.2 Validação e Tipagem com Union Types
// Implemente uma função que recebe uma string representando uma operação matemática (add, subtract, multiply, divide) e dois números. 
// A função deve realizar a operação correspondente e lançar um erro caso a operação não seja suportada.
function calculate(operation, valueOne, valueTwo) {
    switch (operation) {
        case 'add':
            return valueOne + valueTwo;
        case 'subtract':
            return valueOne - valueTwo;
        case 'multiply':
            return valueOne * valueTwo;
        case 'divide':
            const zeroDivision = 0;
            if (valueTwo === zeroDivision) {
                throw new Error('Divisão por zero');
            }
            return valueOne / valueTwo;
        default:
            throw new Error('Operação não suportada');
    }
}
console.log(calculate('add', 10, 5));
console.log(calculate('divide', 10, 0));
console.log(calculate('multiply', 10, 5));
console.log(calculate('subtract', 10, 5));
