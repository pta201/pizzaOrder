import React, { useContext, useEffect, useState } from "react";
import { CartContext } from "../../context/cart-context";
import CartItem from "./CartItem";
import CartModal from "./CartModal";

const CartContent = () => {
  const cartContext = useContext(CartContext);
  const [updateQuantity, setupdateQuantity] = useState(false);

  const [items, setItems] = useState(cartContext.items);
  const [selectedItem, setSelectedItem] = useState({});

  useEffect(() => {
    setItems(cartContext.items);
  }, [cartContext.items, cartContext.totalAmount]);

  const openModal = (item) => {
    const selected = cartContext.getItemByID(item.id);
    setSelectedItem(selected);

    setupdateQuantity(true);
  };
  const removeItem = (item) => {
    const selected = cartContext.getItemByID(item.id);

    cartContext.removeItem(selected);
  };

  if (items.length === 0) {
    return <></>;
  } else {
    return (
      <>
        {updateQuantity && (
          <CartModal
            id={selectedItem.id}
            title={selectedItem.title}
            amount={selectedItem.amount}
            onExit={() => setupdateQuantity(false)}
          />
        )}
        {items.map((item) => (
          <CartItem
            key={item.id}
            title={item.title}
            price={item.price}
            amount={item.amount}
            onClick={() => openModal(item)}
            onRemoveItem={() => removeItem(item)}
            // onExit={() => setupdateQuantity(false)}
          />
        ))}
      </>
    );
  }
};

export default CartContent;
