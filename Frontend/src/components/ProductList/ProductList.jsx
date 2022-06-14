import React, { useState } from "react";

import ProductCard from "../ProductCard/ProductCard";
import GridLayout from "../../UI/Layout/GridLayout/GridLayout";

const ProductList = (props) => {
  const [products, setProducts] = useState(props.products);
  // const product8 = [];
  // products.forEach((product, index) => {
  //   if (index <= 8) {
  //     product8.push(product);
  //   } else {
  //   }
  // });
  return (
    <GridLayout>
      {products.map((product) => (
        <ProductCard
          id={product.id}
          key={product.id}
          image={product.image}
          title={product.name}
          description={product.description}
          price={product.size.price}
        />
      ))}
    </GridLayout>
  );
};

export default ProductList;
