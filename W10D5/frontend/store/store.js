import {createStore} from 'redux';
import rootReducer from '../reducers/root_reducer'

//const configureStore = createStore(rootReducer);
const configureStore = (preloadedState = {} ) => {
  return createStore(rootReducer, preloadedState)
}



export default configureStore; //exports a function that creates the store