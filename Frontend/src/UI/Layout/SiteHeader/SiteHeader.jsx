import React from "react";
import { Layout, Image, Menu } from "antd";
import classes from "./SiteHeader.module.css";
import HeaderNav from "../HeaderNav/HeaderNav";
const { Header } = Layout;
const SiteHeader = () => {
  return (
    <Header className={classes.header}>
      <div> </div>
      <Image
        preview={false}
        src={
          "http://logok.org/wp-content/uploads/2014/11/PizzaHut_logo-880x660.png"
        }
        height={"6rem"}
      />
      <HeaderNav />
    </Header>
  );
};

export default SiteHeader;
