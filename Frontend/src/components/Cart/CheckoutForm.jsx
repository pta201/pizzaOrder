import { Form, Input, Button, Divider } from "antd";
import React from "react";
import classes from "./CheckoutForm.module.css";

const layout = {
  labelCol: { span: 10 },
  wrapperCol: { span: 12 },
};
/* eslint-disable no-template-curly-in-string */
const validateMessages = {
  required: "${label} is required!",
};
/* eslint-enable no-template-curly-in-string */

const CheckoutForm = (props) => {
  const onFinish = (values) => {
    props.onSubmit(values);
  };
  return (
    <Form
      {...layout}
      className={classes[`checkout-form`]}
      onFinish={onFinish}
      validateMessages={validateMessages}
    >
      <Divider>Thông tin khách hàng</Divider>
      <Form.Item
        name={["customer", "name"]}
        label="Name"
        rules={[{ required: true }]}
      >
        <Input />
      </Form.Item>
      <Form.Item
        name={["customer", "phone"]}
        label="Phone Number"
        rules={[{ required: true }]}
      >
        <Input type="tel" />
      </Form.Item>
      <Form.Item
        name={["customer", "address"]}
        label="Address"
        rules={[{ required: true }]}
      >
        <Input.TextArea />
      </Form.Item>
      <Form.Item wrapperCol={{ ...layout.wrapperCol, offset: 8 }}>
        <Button type="primary" htmlType="submit">
          Submit
        </Button>
        <Button type="outlined" onClick={props.onCancel}>
          Cancel
        </Button>
      </Form.Item>
    </Form>
  );
};

export default CheckoutForm;
