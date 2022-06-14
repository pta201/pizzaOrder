import React from "react";
import classes from "./Button.module.css";

const Button = (props) => {
  return (
    <button
      placeholder={props.placeholder || ""}
      type={props.type || `button`}
      className={`${props.className} ${classes.button}`}
      {...props}
    >
      {props.children}
    </button>
  );
};

export default Button;
