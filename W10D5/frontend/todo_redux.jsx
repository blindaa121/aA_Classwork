import React from 'react';
import ReactDom from 'react-dom';
import configureStore from './store/store'
import App from './components/app'
import Root from './components/root'  

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  ReactDom.render(<Root store = {store}/>, root);
  window.store = store;
});
