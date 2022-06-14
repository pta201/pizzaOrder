import React from "react";
import * as ReactDOM from "react-dom";
import classes from "./Modal.module.css";
import Card from "../Card/Card";

const Modal = (props) => {
  const content = (
    <Card {...props} className={`${classes.modal} ${props.className}`}>
      {props.children}
    </Card>
  );
  const container = document.getElementById("modal-root");

  return ReactDOM.createPortal(content, container);
};

export default Modal;
