import React, { useContext, useState, useEffect } from "react";
import { CartContext } from "../../context/cart-context";
import { Button } from "antd";
import CheckoutForm from "./CheckoutForm";
import classes from "./CartFooter.module.css";
const CartFooter = (props) => {
  const cartContext = useContext(CartContext);
  const [totalAmount, setTotalAmount] = useState(cartContext.totalAmount);
  const [isCheckout, setIsCheckout] = useState(false);
  useEffect(() => {
    setTotalAmount(cartContext.totalAmount);
  }, [cartContext.totalAmount]);
  const onCancel = () => {
    setIsCheckout(false);
  };
  const checkoutSubmitHandler = (customerInfo) => {
    props.onGetCustomerInfo(customerInfo);
    setIsCheckout(false);
  };
  return (
    <footer className={classes[`cart-footer`]}>
      <div className={classes[`order-detail`]}>
        <div>
          <p>Tổng tiền:</p>
          <p>{totalAmount}đ</p>
        </div>
      </div>
      <div className={classes[`order-actions`]}>
        <Button
          type="primary"
          onClick={() => {
            setIsCheckout(true);
          }}
        >
          Thanh toán
        </Button>
      </div>
      {isCheckout && (
        <CheckoutForm onCancel={onCancel} onSubmit={checkoutSubmitHandler} />
      )}
    </footer>
  );
};

export default CartFooter;
