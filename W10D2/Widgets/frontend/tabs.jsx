import React from "react"

class Tabs extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            tabIndex: 0
        }
        this.clickHandler = this.clickHandler.bind(this);
    }

    clickHandler(e) {

        // let index = e.currentTarget.innerHTML
        this.setState({ tabIndex: data.id }),
        // if (index === "one") {
        //     this.setState({tabIndex: 1});
        // } else if (index === "two") {
        //     this.setState({tabIndex: 2});
        // } else {
        //     this.setState({tabIndex: 3});
        // }

        let ob = {
            "one": this.setState({tabIndex: 1}),
            "two": this.setState({tabIndex: 2}),
            "three": this.setState({tabIndex: 3}),
        }
        ob[index]
    }

    render() {
        
        let content = this.props.tabcontent[this.state.tabIndex]
        return(
            <div>
                <div className="tabsWrapper">
                    <ul className="tabs">
                        <span>
                            <h1 onClick={this.clickHandler} data = "1">one</h1>
                        </span>
                        <span>
                            <h1 onClick={this.clickHandler}>two</h1>
                        </span>
                        <span>
                            <h1 onClick={this.clickHandler}>three</h1>
                        </span>
                    </ul>
                    <article>{content}</article> 
                </div>
            </div>
        )
    }
}

export default Tabs