import React from "react";
import Clock from "./clock";
import Tabs from "./tabs"
// import Weather from "./weather"

const App = () => {
    const tabs = {1:"I'm the first" , 2: "I'm the second", 3:"I'm the third" }
    return(
        <div> 
            <Clock/>
            <Tabs tabcontent={tabs}/>
            {/* <Weather/> */}
        </div>

    )
}

export default App