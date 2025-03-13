import React, { useEffect, useState } from "react";
import axios from "axios";

const API_URL = `${process.env.REACT_APP_API_URL}/items`

function App() {
  const [items, setItems] = useState([]);
  const [name, setName] = useState("");
  const [description, setDescription] = useState("");

  useEffect(() => {
    axios.get(API_URL).then((response) => setItems(response.data));
  }, []);

  const addItem = () => {
    axios.post(API_URL, { name, description }).then((response) => {
      setItems([...items, response.data]);
      setName("");
      setDescription("");
    });
  };

  return (
    <div>
      <h1>Items</h1>
      <ul>
        {items.map((item) => (
          <li key={item.id}>{item.name}: {item.description}</li>
        ))}
      </ul>
      <h2>Add Item</h2>
      <input
        type="text"
        placeholder="Name"
        value={name}
        onChange={(e) => setName(e.target.value)}
      />
      <input
        type="text"
        placeholder="Description"
        value={description}
        onChange={(e) => setDescription(e.target.value)}
      />
      <button onClick={addItem}>Add</button>
    </div>
  );
}

export default App;
