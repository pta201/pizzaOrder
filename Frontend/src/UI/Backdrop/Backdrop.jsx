import React from "react";
import ReactDOM from "react-dom";
import classes from "./Backdrop.module.css";

const Backdrop = (props) => {
  const content = (
    <div className={classes.backdrop} {...props}>
      {props.children}
    </div>
  );
  const container = document.querySelector("#backdrop-root");

  return ReactDOM.createPortal(content, container);
};

export default Backdrop;
