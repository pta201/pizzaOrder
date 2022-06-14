import React, { useContext } from "react";
import { Card, Button } from "antd";
import { CartContext } from "../../context/cart-context";

import classes from "./ProductCard.module.css";

const { Meta } = Card;

const ProductCard = (props) => {
  const cartContext = useContext(CartContext);

  const item = {
    id: props.id,
    title: props.title,
    price: Number(props.price),
    amount: 1,
  };
  return (
    <Card
      hoverable
      cover={<img alt={props.title} src={props.image} />}
      className={classes["product-card"]}
    >
      <Meta
        className={classes["product-card-meta"]}
        title={props.title}
        description={props.description}
      />
      <footer className={classes.actions}>
        <p>
          Giá từ: <span>{props.price}</span>
        </p>
        <Button type="primary" onClick={() => cartContext.addItem(item)}>
          Chọn
        </Button>
      </footer>
    </Card>
  );
};

export default ProductCard;
