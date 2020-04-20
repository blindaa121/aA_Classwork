import {RECEIVE_TODO, RECEIVE_TODOS} from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};


const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    let nextState// creates a copy of state
    switch(action.type) {
        case RECEIVE_TODO:
            nextState = Object.assign({}, state); 
            nextState[action.todo.id] = action.todo;
            return nextState;
        case RECEIVE_TODOS:
            nextState = {};
           // for (let i in action.todos) 
            for (let i of action.todos){
                nextState[i.id] = i
            };
            return nextState;
        default:
            return state;
    }
}

export default todosReducer