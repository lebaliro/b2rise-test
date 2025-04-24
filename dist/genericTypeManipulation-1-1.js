"use strict";
function extractValues(data, key) {
    return data.map((item) => item[key]);
}
const data = [
    { id: 1, name: 'Alice' },
    { id: 2, name: 'Bob' }
];
const result = extractValues(data, 'name');
console.log(result);
