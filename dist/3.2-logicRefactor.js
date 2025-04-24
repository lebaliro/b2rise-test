"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const LIMIT_TO_DISCOUNT = 100;
function getDiscountPremium(price) {
    const discount = price > LIMIT_TO_DISCOUNT ? 0.8 : 0.9;
    return price * discount;
}
function getDiscountRegular(price) {
    const discount = price > LIMIT_TO_DISCOUNT ? 0.9 : 1;
    return price * discount;
}
function calculateDiscount(price, isPremium) {
    return isPremium ? getDiscountPremium(price) : getDiscountRegular(price);
}
