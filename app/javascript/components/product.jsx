import React from 'react'
import './product.css'
// import Zoom from 'react-medium-image-zoom'
// import ReactImageZoom from 'react-image-zoom';
// import { Table } from 'reactstrap';
// import 'bootstrap/dist/css/bootstrap.min.css';
export default class Product extends React.Component{

  state = {
    backgroundImage: `url(${this.props.data.image1})`,
    backgroundPosition: '0% 0%'
  }
  // state = { isOpen: false };

  // handleShowDialog = () => {
  //   this.setState({ isOpen: !this.state.isOpen });
  //   console.log(this.state.isOpen);
  // };

  handleMouseMove = e => {
    const { left, top, width, height } = e.target.getBoundingClientRect()
    const x = (e.pageX - left) / width * 100
    const y = (e.pageY - top) / height * 100
    this.setState({ backgroundPosition: `${x}% ${y}%` })
  }

  render(){
    console.log(this.props.data)
  return(<div className="column is-two-fifths" style={{marginLeft: "350px"}}>
        <div className="card products">
  <div className="card-image">
    <figure className="image is-5by4" onMouseMove={this.handleMouseMove} style={this.state}>
    <img src={this.props.data.image1} alt={this.props.data}/>
    </figure>
    {/* {this.state.isOpen && (
          <dialog
            className="dialog"
            style={{ float: "right" }}
            open
            onClick={(e)=>this.handleShowDialog(e)}
          >
            <img
              className="image"
              src={this.props.data.image1}
              onClick={(e)=>this.handleShowDialog(e)}
              alt={this.props.data}
            />
          </dialog>
        )} */}
        {/* <%= image_tag url_for(product.thumbnail), alt: product.name%> */}
  </div>
  <div className="card-content">
    <div className="media">
      <div className="media-content">
        <p className="title is-4">{this.props.data.name}</p>
        <p className="subtitle is-6"><strong>Amount: </strong> {this.props.data.price}</p>
      </div>
    </div>
    <div className="content">
      {this.props.data.description}
    </div>
  </div>
  </div>
  </div>)
  }}