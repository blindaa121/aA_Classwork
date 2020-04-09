const View = require('./ttt-view.js')// require appropriate file
const Game = require("./game.js") // require appropriate file

  $(() => {
    const $rootEl = $('.ttt'); //not sure if this is correct, but I'm referring to the ttt class in our index.html
    const game = new Game(); 
    new View(game, $rootEl); // new view object
    // Your code here
  });
