import React, { useState, useContext } from "react";

import Backdrop from "../../UI/Backdrop/Backdrop";
import Modal from "../../UI/Modal/Modal";
import Button from "../../UI/Button/Button";

import classes from "./CartModal.module.css";

import { CartContext } from "../../context/cart-context";

const CartModal = (props) => {
  const cartContext = useContext(CartContext);
  const item = cartContext.getItemByID(props.id);

  const [quantity, setQuantity] = useState(item.amount);

  const updateQuantity = () => {
    cartContext.setItemQuantity(item, quantity);
    props.onExit();
  };
  const modifyQuantity = (isAdd = true) => {
    if (isAdd) {
      setQuantity((prevQuantity) => ++prevQuantity);
    } else {
      if (quantity === 1) {
        return;
      } else {
        setQuantity((prevQuantity) => --prevQuantity);
      }
    }
  };

  return (
    <>
      <Backdrop onClick={props.onExit}></Backdrop>
      <Modal {...props}>
        <h2>{props.title}</h2>
        <div className={classes["product-quantity"]}>
          <Button
            style={{ margin: "0.5rem 1rem" }}
            onClick={() => modifyQuantity(false)}
          >
            -
          </Button>
          <p>{quantity}</p>
          <Button
            style={{ margin: "0.5rem 1rem" }}
            onClick={() => modifyQuantity(true)}
          >
            +
          </Button>
        </div>
        <footer className={classes.actions}>
          <Button style={{ margin: "0.5rem 1rem" }} onClick={props.onExit}>
            Huỷ
          </Button>
          <Button style={{ margin: "0.5rem 1rem" }} onClick={updateQuantity}>
            Lưu
          </Button>
        </footer>
      </Modal>
    </>
  );
};

export default CartModal;
