import React from "react";

export default class Tile extends React.Component{
    constructor(props){
        super(props);
    }

    handleClick() {
      this.props.updateGame();
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
        <div className={tileClass}>{tileIcon}</div>
      );
    }
    
}