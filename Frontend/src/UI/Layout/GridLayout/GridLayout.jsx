import React from "react";
import classes from "./GridLayout.module.css";
const GridLayout = (props) => {
  return (
    <div className={`${classes[`grid`]} ${props.className}`}>
      {props.children}
    </div>
  );
};

export default GridLayout;
