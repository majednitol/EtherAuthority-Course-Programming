
import { useState } from "react";
import "./Todo.css";

export default function TodoApp() {
  const [todos, setTodos] = useState([]);
  const [text, setText] = useState("");
  const [search, setSearch] = useState("");

  const addTodo = () => {
    if (!text.trim()) return;
    setTodos([...todos, { id: Date.now(), title: text, completed: false }]);
    setText("");
  };

  const toggleStatus = (id) => {
    setTodos(todos.map(t => t.id === id ? { ...t, completed: !t.completed } : t));
  };

  const deleteTodo = (id) => {
    setTodos(todos.filter(t => t.id !== id));
  };

  const filteredTodos = todos.filter(t =>
    t.title.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="todo-container">
      <h2>Todo App</h2>

      <div className="input-group">
        <input
          type="text"
          placeholder="Add new todo"
          value={text}
          onChange={(e) => setText(e.target.value)}
        />
        <button onClick={addTodo}>Add</button>
      </div>

      <div className="input-group">
        <input
          type="text"
          placeholder="Search todo"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />
      </div>

      <ul>
        {filteredTodos.map(todo => (
          <li key={todo.id} className={todo.completed ? "completed" : ""}>
            <span>{todo.title}</span>
            <div className="actions">
              <button onClick={() => toggleStatus(todo.id)}>
                {todo.completed ? "Undo" : "Done"}
              </button>
              <button className="delete" onClick={() => deleteTodo(todo.id)}>
                Delete
              </button>
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
}


