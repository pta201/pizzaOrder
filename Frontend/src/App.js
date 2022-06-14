import { BrowserRouter, Routes, Route } from "react-router-dom";

import "./App.css";

import "antd/dist/antd.css";
import { CartContextProvider } from "./context/cart-context";

import Menu from "./pages/Menu";
import Orders from "./pages/Orders";

function App() {
  return (
    <CartContextProvider>
      <BrowserRouter>
        <Routes>
          <Route path="*" element={<Menu replace />} />
          <Route path="/menu" element={<Menu />} />
          <Route path="/orders" element={<Orders />} />
        </Routes>
      </BrowserRouter>
    </CartContextProvider>
  );
}

export default App;
