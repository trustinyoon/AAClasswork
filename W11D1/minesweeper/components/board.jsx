import React from "react";

export default class Board extends React.Component{
    constructor(props){
        super(props);    
    }


    render(){
        return(
            <div>
                {this.props.board.map( (row,rowIdx)=>{
                    <div>{row.map((tile,colIdx)=>{
                        <Tile key={rowIdx+colIdx} updateGame={this.props.updateGame} tile={tile}/>
                    })}</div>
                })}
            </div>
        )
    }
}