interface Data {
    id: number;
    name: string;
}

function extractValues<D, K extends keyof D>(data: D[], key: K): Array<D[K]> {
    return data.map((item: D) => item[key]);
}

const data: Data[] = [
    { id: 1, name: 'Alice' },
    { id: 2, name: 'Bob' }
  ];
const result = extractValues(data, 'name');

console.log(result);

export {}