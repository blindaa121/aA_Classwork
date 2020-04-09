class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", (ele => {
      const $square = $(ele.currentTarget);
      this.makeMove($square);
    }))
  }

  makeMove($square) {
  

  }

  setupBoard() {
    // this.$el.append("hello");

    // const ul = $("<ul>");
    // let li = $("<li>");


    // li.data("bar", [0,0]);
    // ul.append(li);
    // this.$el.append(ul);
    
    // li.data("bar", [0,1]);
    // ul.append(li);
    // this.$el.append(ul);
    
    // li.data("foo", [0,2]);
    // ul.append(li);
    // this.$el.append(ul);
    
    // li.data("foo", [1,0]);
    // ul.append(li);
    // this.$el.append(ul);
    


    const ul = $("<ul>");
    // i = row, j = col
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let li = $("<li>");
        li.data("foo", [i.j]);
        ul.append(li);
      }
    }
    this.$el.append(ul);

  }
}

// View.prototype.setupBoard = function () {
//   $el.append("hello");

//   // make a grid to represent the board
//   const ul = $("<ul>");
//   let li = $("<li>");
//   // i = row, j = col
//   for(let i = 0; i < 3; i++) {
//     for(let j = 0; j < 3; j++) {

//     }
//   }

// }

module.exports = View;
