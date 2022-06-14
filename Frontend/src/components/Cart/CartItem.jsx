import React, { useState, useEffect } from "react";
import classes from "./CartItem.module.css";
import CartModal from "./CartModal";
import Button from "../../UI/Button/Button";

const CartItem = (props) => {
  const totalPrice = props.amount * props.price;
  return (
    <>
      <article className={classes[`cart-item`]}>
        <div onClick={props.onClick} className={classes.amount}>
          {props.amount}
        </div>

        <div className={classes.title}>{props.title}</div>

        <div className={classes.price}>{props.price}</div>
        <div className={classes[`total-price`]}>{totalPrice}</div>
        <div>
          <Button onClick={props.onRemoveItem}>Xoá</Button>
        </div>
      </article>
    </>
  );
};

export default CartItem;
