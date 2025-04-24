interface Item {
    name: string;
    price: number;
}

function getExpensiveItems(items: Item[]): void {
    const valueConsideredExpensive = 100;

    const expensiveItems = items.filter(item => item.price > valueConsideredExpensive)

    expensiveItems.forEach(item => {
        const information = `${item.name} is expensive`;
        console.log(information);
    });
}

export { }
