import React, { useState, useEffect } from "react";
import axios from "axios";
import ProductList from "../components/ProductList/ProductList";
import Cart from "../components/Cart/Cart";

import { Layout, Row, Col, Divider } from "antd";
import SiteHeader from "../UI/Layout/SiteHeader/SiteHeader";

const { Content, Footer } = Layout;

const Menu = () => {
  const [products, setProducts] = useState();
  useEffect(() => {
    async function fetchData() {
      try {
        const response = await axios.get("https://localhost:7259/api/pizzas");
        const productList = await response.data;
        setProducts(productList);
      } catch (error) {
        console.error(error);
      }
    }
    fetchData();
  }, []);
  return (
    <>
      <Layout>
        <SiteHeader />
      </Layout>
      <Layout className="layout">
        <Row>
          <Col span={16}>
            <Content>
              {products !== undefined && (
                <ProductList products={products}></ProductList>
              )}
            </Content>
          </Col>
          <Divider type="vertical" />
          <Col span={7}>
            <Cart />
          </Col>
        </Row>
      </Layout>
    </>
  );
};

export default Menu;
