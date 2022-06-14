import React from "react";
import { NavLink } from "react-router-dom";
import classes from "./HeaderNav.module.css";
const HeaderNav = () => {
  return (
    <nav className={classes.menu}>
      <ul>
        <li>
          <NavLink to="/menu">Menu</NavLink>
        </li>
        <li>
          <NavLink to="/orders">Orders</NavLink>
        </li>
      </ul>
    </nav>
  );
};

export default HeaderNav;
