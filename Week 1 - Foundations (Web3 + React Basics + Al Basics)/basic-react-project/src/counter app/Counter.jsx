import React, { useState } from 'react';

import  './Counter.css'; 
const Counter = () => {
    const [count, setCount] = useState(0);

    const increment = () => setCount(count + 1);
    const decrement = () => setCount(count - 1);

    return (
        <div className="counter-container">
            <h1>Counter App</h1>
            <h2>{count}</h2>
            <div>
                <button onClick={increment}>Increment</button>
                <button onClick={decrement}>Decrement</button>
            </div>
        </div>
    );
}

export default Counter;
