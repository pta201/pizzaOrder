import React, { useContext } from "react";
import { CartContext } from "../../context/cart-context";

import classes from "./CartHeader.module.css";

const CartHeader = () => {
  const cartCtx = useContext(CartContext);
  const itemNumber = cartCtx.items.length || 0;
  return (
    <>
      <header>
        <h2>----Cart----</h2>
        <div className={classes["cart-info"]}>
          {itemNumber > 0 ? (
            <span>Cart has {itemNumber} items</span>
          ) : (
            <span>Cart is empty</span>
          )}
        </div>
      </header>
    </>
  );
};

export default CartHeader;
