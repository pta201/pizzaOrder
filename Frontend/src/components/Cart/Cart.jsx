import React, { useContext, useState } from "react";
import axios from "axios";

import CartHeader from "./CartHeader";
import CartContent from "./CartContent";
import CartFooter from "./CartFooter";
import Modal from "../../UI/Modal/Modal";
import Backdrop from "../../UI/Backdrop/Backdrop";

import { CartContext } from "../../context/cart-context";

import classes from "./Cart.module.css";

const Cart = () => {
  const [isCompleted, setIsCompleted] = useState(false);
  const cartContext = useContext(CartContext);
  const submitCart = (customerInfo) => {
    const cartItems = cartContext.items;
    console.log("Customer Info: ", customerInfo);
    console.log("Cart Items: ", cartItems);
    const order_pizzas = [];
    cartItems.forEach((item) => {
      order_pizzas.push({
        pizzaId: item.id,
        quantity: item.amount,
      });
    });
    const totalPrice = cartItems.reduce(
      (total, item) => (total += item.price * item.amount),
      0
    );

    const orderInfo = {
      customerName: customerInfo["customer"].name,
      customerAddress: customerInfo["customer"].address,
      customerPhone: customerInfo["customer"].phone,
      totalPrice: totalPrice,
      orderPizzas: order_pizzas,
    };
    console.log(orderInfo);
    axios.post("https://localhost:7259/api/orders", orderInfo);
    cartContext.resetCart();
    setIsCompleted(true);
  };

  return (
    <section className={classes.cart}>
      <CartHeader />
      <CartContent />
      <CartFooter onGetCustomerInfo={submitCart} />
      {isCompleted && (
        <Backdrop onClick={() => setIsCompleted((prev) => false)}>
          <Modal onClick={() => setIsCompleted((prev) => false)}>
            Checkout Completed
          </Modal>
        </Backdrop>
      )}
    </section>
  );
};

export default Cart;
