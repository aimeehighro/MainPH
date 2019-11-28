import React from 'react'
// import { Table } from 'reactstrap';
// import 'bootstrap/dist/css/bootstrap.min.css';

export default class Cart extends React.Component{
  constructor(props) {
    super(props);
    this.state = {isToggleOn: true};

    // This binding is necessary to make `this` work in the callback
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    // Remove saved data from sessionStorage
sessionStorage.removeItem(cart);
  }
  render(){
    let carts = [];
    for (let cart of this.props.data){
      carts.push(cart)
    }
    console.log(carts)
  return(<div>
       <table className="table is-bordered is-striped is-hoverable is-fullwidth">
  <thead>
  <tr>
  <th>#</th>
  <th>
      Product
      </th>
        <th>
     Unit Price
      </th>
              <th>
      Qty
      </th>
      <th>
      Action
      </th>
      </tr>
      </thead>
      {carts.map((cart, index) => {
                return(
                  <tbody key={cart.id}>
                    <tr>
                <td>{index + 1}</td>
                <td>{cart.name}</td>
                <td>{cart.price}</td>
                <td>N/A</td>
                <td> <button class="button is-danger" onClick={this.handleClick}>Remove</button></td>
                </tr>
                </tbody>)
      })}
  </table>
</div>)
  }
}