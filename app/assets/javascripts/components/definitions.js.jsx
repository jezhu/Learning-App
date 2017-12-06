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
      definitions = this.state.definitions.map(function(i) {
        if(i.content != null && i.content != "")
          return <li key={i.id}>{i.content}</li>
      });
    }
      
    return(<div className="definitions"><ul>{definitions}</ul></div>);
  }
}