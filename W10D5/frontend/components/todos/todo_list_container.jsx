import React from 'react';
import { connect } from 'react-redux';
import todoList from './todo_list';  //presenter
import { receiveTodos , receiveTodo  } from '../../actions/todo_actions';
import allTodos from '../../reducers/selectors'

const mapStateToProps = (state) => ({
  todos: allTodos(state) // turn teas state into array of tea objects to map over
});

// function that allows us to hand functions to component that can dispatch
// actions to redux store (write to store). Functions close over dispatch.
const mapDispatchToProps = dispatch => ({
  receiveTodo: banana => dispatch(receiveTodo(banana)),
  // receiveTodos: todo => dispatch(receiveTodos(todo))
});

// connect invokes mapStateToProps with store.getState() and mapDispatchToProps
// with store.dispatch
export default connect(mapStateToProps, mapDispatchToProps)(todoList);