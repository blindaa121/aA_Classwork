//this component will use controlled inputs to keep track of its form data; thus it will have a local state
import React from 'react';
import { uniqueId } from '../../util/id_generator'

class TodoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            title: "",
            body: "",
            done: false
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    update(property) {
        return e => this.setState({[property]: e.target.value});
    }

    handleSubmit(e) {
        e.preventDefault();
        const todo = Object.assign({}, this.state, {id: this.props.tdlist.length + 1 });
        this.props.receiveTodo(todo);
        this.setState({
            title: "",
            body: ""
        }); // reset form 
    }

    render() {
        return (
            <form className="todo-form" onSubmit={this.handleSubmit}>
            <label>Title: 
                <input
                    className="input"
                    ref="title"
                    value={this.state.title}
                    placeholder="buy milk"
                    onChange={this.update('title')}
                    required/>
            </label>
            <label>Body: 
                <input
                    className="input"
                    ref="body"
                    value={this.state.body}
                    placeholder="2% or whatever is on sale!"
                    onChange={this.update('body')}
                    required/>
            </label>
            <button className="create-button">Create Todo!</button>
            </form>
        )
    }
}

export default TodoForm