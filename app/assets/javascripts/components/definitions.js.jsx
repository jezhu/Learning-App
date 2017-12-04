class Definitions extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      definitions: []
    };
  }
  
  componentWillReceiveProps(props){
    if(props) {
      this.setState({definitions: props.definitions});
    }
  }
  
  render() {
    let definitions;
    if(this.state.definitions) {
      definitions = this.state.definitions.map((i) =>
        <li key={i.id}>{i.content}</li>
      );
    }
      
    return(<div><ul>{definitions}</ul></div>);
  }
}