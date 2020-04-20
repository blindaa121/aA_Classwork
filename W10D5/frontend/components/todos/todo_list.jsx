import React from 'react';
import TodoForm from './todo_form'

// export default () => <h3>Todo List goes here!</h3>

const todoList = (props) => {
  function addGreenTea() {
    // debugger
    props.receiveTodo({  // refer to mapDispatchtoProps
      id: props.todos.length + 1,
      title: 'green',
      body: 2.50,
      done: false
    })
  }

  return (
    <div>
      <h1>All Todos</h1>
      <ul>
        {/* gets teas in props via container */}
        {props.todos.map(todo => {
          // <TeaIndexItem tea={tea} />
          return (
            <>
              <li>Title: {todo.title}</li>
              <li>Body: {todo.body}</li>
              <li>Is it done? { todo.done.toString() }</li>
              <li>{todo.id}</li>
            </>
          )
        })}
      </ul>
      <TodoForm tdlist={props.todos} receiveTodo={props.receiveTodo}/>
      <button onClick={addGreenTea}>Add Todo!</button>
    </div>
  );
}
export default todoList;