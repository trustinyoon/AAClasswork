import React from "react";
import Tile from "./tile";

export default class MyBoard extends React.Component{
    constructor(props){
        super(props);    
    }


    render(){
        return(
            <div className="grid"> 
                {this.props.board.grid.map( (row,rowIdx)=>{
                    return (<div key={rowIdx} className="row">{row.map((tile,colIdx)=>{
                      return (
                        <Tile key={rowIdx.toString() + colIdx.toString()} updateGame={this.props.updateGame} tile={tile}/>  
                        )
                    })}</div>)
                })}
            </div>
        )
    }
}