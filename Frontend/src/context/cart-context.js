import React, { useState, createContext } from "react";

const CartContext = createContext();

const CartContextProvider = ({ children }) => {
  // State
  const [items, setItems] = useState([]);
  const [totalAmount, setTotalAmount] = useState(0);

  const addItem = (itemToAdd) => {
    let newItems = [...items];

    const existingIndex = newItems.findIndex(
      (item) => item.id === itemToAdd.id
    );
    if (existingIndex >= 0) {
      const newQuantity = parseInt(
        newItems[existingIndex].amount + itemToAdd.amount
      );

      newItems[existingIndex] = {
        ...itemToAdd,
        amount: newQuantity,
      };
    } else {
      newItems.push(itemToAdd);
    }
    setItems(newItems);
    reEvaluateTotalAmount(newItems);
  };

  const removeItem = (itemToRemove) => {
    const newItems = items.filter((item) => item.id !== itemToRemove.id);
    setItems(newItems);
    reEvaluateTotalAmount(newItems);
  };
  const getItemByID = (id) => {
    const existingIndex = items.findIndex((item) => item.id === id);
    return items[existingIndex];
  };
  const setItemQuantity = (itemToUpdate, quantity) => {
    const existingIndex = items.findIndex(
      (item) => item.id === itemToUpdate.id
    );
    items[existingIndex].amount = quantity;
    reEvaluateTotalAmount(items);
  };
  const reEvaluateTotalAmount = (items) => {
    const newTotalAmount = items.reduce(
      (totalAmount, item) => totalAmount + item.amount * item.price,
      0
    );
    setTotalAmount(newTotalAmount);
  };
  const resetCart = () => {
    setItems([]);
    setTotalAmount(0);
  };
  // Context data
  const contextData = {
    items,
    totalAmount,
    addItem,
    removeItem,
    setItemQuantity,
    getItemByID,
    resetCart,
  };

  // Return Provider
  return (
    <CartContext.Provider value={contextData}>{children}</CartContext.Provider>
  );
};

export { CartContextProvider, CartContext };
