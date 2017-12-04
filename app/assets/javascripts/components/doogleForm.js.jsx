class DoogleForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      word: "",
      definitions: [],
      showError: false
    };
    
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.triggerError = this.triggerError.bind(this);
  }
  
  handleChange(e){
    this.setState({word: e.target.value});
  }
  
  handleSubmit(e){
    e.preventDefault();
  
    // Reset defaults
    this.setState({definitions: []});
    this.setState({showError: false});
    $("#word-input").removeClass("error-display");

    $.ajax({
      url: '/search',
      dataType: 'json',
      type: 'POST',
      data: { word: this.state.word },
      success: function(data) {
        if(data)
          this.setState({definitions: data});
        else
          this.triggerError();
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(status);
      }.bind(this)
    });
  }
  
  triggerError() {
    $("#word-input").addClass("error-display");
    this.setState({showError: true});
  }
  
  render() {
    return(
      <div className="doogle-form">
        <form className='form-inline' onSubmit={this.handleSubmit}>
          <input type="text" id="word-input" className='form-control' name="search" value={this.state.word} onChange={this.handleChange}/>
          <br />
          { this.state.showError ? <p className='error-message'>No definition found.</p> : <div></div>}
          <input type="submit" className='btn btn-primary' value="Doogle Search" />
        </form>
        <Definitions definitions={this.state.definitions}/>
      </div>
    );
  }
}