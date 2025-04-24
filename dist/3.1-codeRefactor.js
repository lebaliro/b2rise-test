"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function getExpensiveItems(items) {
    const valueConsideredExpensive = 100;
    const expensiveItems = items.filter(item => item.price > valueConsideredExpensive);
    expensiveItems.forEach(item => {
        const information = `${item.name} is expensive`;
        console.log(information);
    });
}
