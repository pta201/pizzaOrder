import React, { useState, useEffect } from "react";
import axios from "axios";

import { Layout, Row, Col, Divider } from "antd";
import SiteHeader from "../UI/Layout/SiteHeader/SiteHeader";
import OrderList from "../components/OrderList/OrderList";

const { Content } = Layout;

const Orders = () => {
  const [orders, setOrders] = useState();
  useEffect(() => {
    async function fetchData() {
      try {
        const response = await axios.get("https://localhost:7259/api/orders");
        const orders = await response.data;
        setOrders(orders);
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
      <Divider>Danh sách đặt hàng</Divider>
      <Layout className="layout">
        <Row>
          <Col span={22} offset={1}>
            <Content> {orders && <OrderList orders={orders} />}</Content>
          </Col>
        </Row>
      </Layout>
    </>
  );
};

export default Orders;
