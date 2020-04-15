import React from "react";

class Clock extends React.Component{
    constructor(){
        super();
        this.state = {
            time: new Date(),
        }
        this.tick = this.tick.bind(this)
    }

    componentDidMount(){
       this.timer = window.setInterval(this.tick, 1000);
    }

    componentWillUnmount(){
        this.timer.clearInterval()
    }

    tick(){
        this.setState({time: new Date()})
    }


    render(){
        return(
            <div className = "wrapper">
                <div className = "time">
                    <h1>Time:</h1>
                    <h1>{this.state.time.getHours() + ":" + this.state.time.getMinutes() + ":" + this.state.time.getSeconds()}</h1>
                </div>

                <div className="date">
                    <h1>Date:</h1>
                    <h1>
                        {this.state.time.toString().split(' ')[0] + " " 
                        + this.state.time.toString().split(' ')[1] 
                        + " " + this.state.time.toString().split(' ')[2]
                        + " " + this.state.time.toString().split(' ')[3]
                        }</h1>
                </div>
            </div>
        )
    }
}

export default Clock;
