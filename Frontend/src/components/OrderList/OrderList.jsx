import React, { useEffect, useState } from "react";
import axios from "axios";
import { Table } from "antd";

const OrderList = (props) => {
  const [orders, setOrders] = useState(props.orders);
  const [dataSource, setDataSource] = useState([]);
  const [detailData, setDetailData] = useState();
  useEffect(() => {
    const data = [];
    orders.forEach((order) => {
      data.push({
        key: order.id,
        ...order,
      });
    });
    setDataSource(data);
  }, [orders]);

  const columns = [
    {
      title: "Name",
      dataIndex: "customerName",
      key: "customerName",
    },
    {
      title: "Address",
      dataIndex: "customerAddress",
      key: "customerAddress",
    },
    {
      title: "Phone Number",
      dataIndex: "customerPhone",
      key: "customerPhone",
    },
    {
      title: "Total",
      dataIndex: "totalPrice",
      key: "totalPrice",
    },
  ];
  useEffect(() => {
    async function fetchData() {
      try {
        const response = await axios.get(
          `https://localhost:7259/api/OrderPizzas`
        );
        const data = await response.data;
        setDetailData(data);
      } catch (error) {
        console.error(error);
      }
    }
    fetchData();
  }, []);

  const OrderDetailTable = (z) => {
    const details = [];
    const detailsToShow = [];
    detailData.forEach((data) => {
      if (data.orderId === z.key) {
        details.push(data);
      }
    });
    details.forEach((detail) => {
      detailsToShow.push({
        key: detail.id,
        "detail-name": detail.pizza.name,
        "detail-quantity": detail.quantity,
        "detail-price": detail.pizza.size.price,
        "detail-total": detail.pizza.size.price * detail.quantity,
      });
    });
    const columns = [
      { title: "Name", dataIndex: "detail-name", key: "detail-name" },
      {
        title: "Quantity",
        dataIndex: "detail-quantity",
        key: "detail-quantity",
      },
      { title: "Price per", dataIndex: "detail-price", key: "detail-price" },
      { title: "Total", dataIndex: "detail-total", key: "detail-total" },
    ];

    return (
      <Table columns={columns} dataSource={detailsToShow} pagination={false} />
    );
  };
  return (
    <Table
      expandedRowRender={OrderDetailTable}
      dataSource={dataSource}
      columns={columns}
    />
  );
};

export default OrderList;
