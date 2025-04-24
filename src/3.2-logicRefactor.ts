const LIMIT_TO_DISCOUNT = 100

function getDiscountPremium(price: number): number {
    const discount = price > LIMIT_TO_DISCOUNT ? 0.8 : 0.9

    return price * discount
}

function getDiscountRegular(price: number): number {
    const discount = price > LIMIT_TO_DISCOUNT ? 0.9 : 1

    return price * discount
}

function calculateDiscount(price: number, isPremium: boolean): number {
    return isPremium ? getDiscountPremium(price) : getDiscountRegular(price)
}

export { }
