import React from 'react'

export default class Test extends React.Component{
  render(){
  return(<div>{JSON.stringify(this.props.data)}</div>)
  }
}