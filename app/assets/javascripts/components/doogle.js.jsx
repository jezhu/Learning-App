class Doogle extends React.Component {
  render() {
    return(
      <div className='doogle'>
        <h1 className='doogle-title'>
          <span className='blue'>D</span>
          <span className='red'>o</span>
          <span className='yellow'>o</span>
          <span className='blue'>g</span>
          <span className='green'>l</span>
          <span className='red'>e</span>
        </h1>
        <DoogleForm />
      </div>
    );
  } 
}