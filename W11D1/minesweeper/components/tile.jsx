import React from "react";

export default class Tile extends React.Component{
    constructor(props){
        super(props);
        this.handleClick = this.handleClick.bind(this);
      
    }

   
    handleClick(e) {
        // this.props.updateGame(this.props.tile, this.props.tile.flagged||this.props.tile.explored);
       
        if(e.altKey){
            console.log('click and press')
        }else{
            console.log('click')
        }
        
    }
    
    render() {
      let tileIcon = "";
      let tileClass = "unClicked";
      
      if (this.props.tile.bombed) {
        tileIcon = "";
        tileClass = "bombed";
      } else if (this.props.tile.explored) {
        tileIcon = "E";
        tileClass = "explored";
      } else if (this.props.tile.flagged) {
        tileIcon = "F";
        tileClass = "flagged";
      }

      return(
        <div onClick={this.handleClick} className={tileClass}>{tileIcon}</div>
      );
    }

}